Everything in the brief is done.

# Report of step 9 of plan 3, the last fixes to /writing

## Open items of the state file

`awk '/^## Open items/{f=1} /^## Closed items/{f=0} f' .scratch/3-the-writing-base/orchestrator-state.md` in the worktree prints the heading and, under it, `none`.

none

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

Sentences of the changed tree, by label (file and section; the text is quoted whole):

- N1: `SKILL.md`, "The review agent's prompt", "A finding", replacement bullets: "It ends every break the passage holds: the one the finding's rule line names, and each other one of the prose standard, the rules page or the registers page."
- N2: same place: "The text it writes breaks no rule of the prose standard, the rules page or the registers page. Examples are these breaks:" with the items N2a "a vague qualifier, a word of size or degree included;", N2b "a sentence over the prose standard's rule on sentence length;", N2c "a change of tense or of voice that the finding does not name;", N2d "two ideas in one sentence;", N2e "a list in paragraph form;", N2f "a relation with no limit where the draft's numbers set one;" and N2g "a performative aside."
- N3: same place: "It keeps every claim and clause of the passage that a rule the finding names does not cut."
- N4: same place: "It changes no claim's scope or strength beyond the change a rule the finding names asks of it." N4b: "A word that sets a claim's scope, such as an article or a quantifier, is kept unless a rule the finding names replaces it."
- N5: same place: "A replacement that renames a thing for any other rule, such as synonym cycling, uses a name that covers the same set, never a narrower or a wider one." N5b: "The new name is a word that the draft does not use for another thing."
- N6: same place: "A word of the kind the prose standard's section A lists as a vague qualifier is one, listed there or not. Examples are the words of frequency "usually", "mostly", "frequently" and "rarely", and the words of size or degree "markedly", "largely", "essentially", "considerably", "repeatedly", "increasingly" and "predominantly"."
- N7: same place: "The replacement of a word of frequency, such as "often", "typically" or "usually", is the share or the count of cases the claim holds in." N7b: "The bracket for such a word asks for that share or count and for no other quantity, such as a size." N7c: "A bracket holds "or" only where each alternative, supplied alone, keeps the claim's scope."
- N8: same place: "The replacement ends each sentence of the passage that is over the prose standard's rule on sentence length, whatever rule the finding names." N8b: "The finding names that rule when its rule line does not." N8c: "No sentence it writes is as long as a sentence the report names as over that rule."
- N9: same place: "A split of a paragraph or of a sentence keeps a condition, such as an opening "If <a condition> holds", in each part that holds a claim the condition governs."
- N10: `references/rules.md`, "Terms defined at first use": "A `.tex` draft is read from the main file's first line, its title included, in the order `SKILL.md`, "What you read", gives." N10b: "A claim that a use is the first is checked against every earlier use."
- N11: `references/rules.md`, "Vague language", after the table: "The rows "many studies" and "some researchers" each cover their phrase with its noun replaced by another noun that names published work or its authors. Examples are "many approaches" and "some studies", and the replacement of the row is then written with that noun." N11b: "Every other row covers its own phrase only."
- N12: `references/rules.md`, "Replacements for flagged terms": "\"robust\" in statistics, for an estimate or a method insensitive to outliers, to departures from the model's assumptions or to the partition of the data, as in \"robust estimator\";"
- N13: `SKILL.md`, "How you group them": "The line states what the reader of this draft wrongly believes or does, or cannot do, because of the group's breaks." N13b: "The line gives the place of one finding of the group where that loss happens, in the form that finding gives its place." N13c: "The loss holds in the draft's own text and data." N13d: "A group whose breaks change no claim says so in its line." with "That line names what the break costs the reader instead at the place it gives, such as a character the reader's viewer may not show." N13e: "Rewrite a line that describes the breaks, restates the rule or names a loss its finding does not show."
- Sentences of the prompt the changed text keeps and the rows rest on: E1 "It is text, written out whole, that stands in place of the passage and reads as a sentence there. It is never an instruction such as ..." and "It is never a reference to another finding or to the passage ..."; E2 "A passage that breaks two or more rules is given once, in the first group that reaches it." with "It names each other rule it breaks, or the other term ..." and "No later group gives it again or refers to it."; E3 "A use of a word that the prose standard's section A says stays is not reported."; E4 "A passage is reported under a rule only when that rule's own words describe the break."; E5 "A limit or a relation it states is checked against every number the draft gives for the claim, its tables and figures included."; E6 "Each part a split leaves meets the prose standard's section D ... A part is counted with the sentences that other findings add to it."; E7 `references/rules.md`, "Evidence for claims": "Evidence the draft gives anywhere counts, cited or not ..."; E8 `references/rules.md`, "Terms defined at first use": "Such a term is used only where the draft defines it at or before the passage."

The operations of "The last pass" are O1 to O15, numbered as `SKILL.md` numbers them: O1 find the quoted words at the place; O2 find every other finding or list entry that quotes the same or overlapping words at that place, outside the forms for a split; O3 check each entry of a list that follows a table's rows under the row of its own section; O4 quote the words of the rule or table row the finding names and read each exception against the passage; O5 for "Evidence for claims", find every other place that states the claim; O6 read the passage against each section of the three pages and list each other rule it breaks; O7 read the replacement as text in the place of the passage; O8 count the words of each sentence the replacement writes; O9 compare the replacement with the passage word by word and give each changed word the rule that asks for it; O10 for each split, find each condition of the passage and the parts it governs; O11 list each technical term the replacement holds that the passage does not and find where the draft defines it; O12 for each relation, list every measure of that property in the text, tables and figures and read the relation under each; O13 read each bracket with "or" with each alternative alone; O14 for a split, write out each part as it reads after every finding and count its sentences and name its ideas; O15 for each group line, name the finding whose place it gives and read the loss at that place.

### The rows

One row per row of `8-marks.md` "Rows not marked right by both" (48 manuscript, 35 grant) and per gate failure. "Fix" is the numbered item of the brief.

| Row or failure | Fix | Sentence that now prevents it | Operation |
|---|---|---|---|
| Manuscript 1.1 | 8 | N2f; E5; the term rule E8 for AUPRC and the expected calibration error | O11, O12 |
| Manuscript 1.2 | 1 | N2c (the voice of "We demonstrate" changed), N1 | - |
| Manuscript 1.9 | 1, 8 | N2f ("a relation with no limit where the draft's numbers set one"); E5 | O12 |
| Manuscript 1.10 | 1, 2, 8 | N2a with N6 ("moderate"), N2f; E5 | O12 |
| Manuscript 1.12 | 1, 2 | N2a with N6 ("at most marginal"), N2d | - |
| Manuscript 2.1 | 1 | N2g ("More interestingly") | - |
| Manuscript 3.1 | 1, 2 | N2a with N6 ("predominately") | - |
| Manuscript 3.3 | 6, 8 | N11b ("Every other row covers its own phrase only"); E4 | O4 |
| Manuscript 3.5 | 1 | N2c ("our study uses" is a Voice break that N1 requires the finding to end and name) | - |
| Manuscript 3.7 | 8 | E7 ("Evidence the draft gives anywhere counts") | O5 |
| Manuscript 3.9 | 1, 2 | N2a with N6 ("repeatedly") | - |
| Manuscript 5.1 | 5 | N10 (the title at `main.tex:45` is read first), N10b | - |
| Manuscript 5.2 | 8 | E1 ("It is never an instruction") | O7 |
| Manuscript 5.4 | 8 | N4b ("Traditional" is a scope word) | O9 |
| Manuscript 5.5 | 3 | N7b ("asks for that share or count and for no other quantity, such as a size") | - |
| Manuscript 5.6 | 6 | N11 ("many existing approaches" is covered by "many studies") | - |
| Manuscript 5.9 | 6 | N11 ("some ... studies" is covered by "some researchers") | - |
| Manuscript 5.11 | 3 | N7 ("typically" is replaced by a share or a count), N7b | - |
| Manuscript 5.12 | 8 | E8 (AUPRC and AUROC brought in before the draft defines them) | O11 |
| Manuscript 5.18 | 8 | N4b ("consecutive folds" is a scope word) | O9 |
| Manuscript 5.19 | 1, 2 | N2a with N6 ("far less pronounced") | - |
| Manuscript 5.20 | 3 | N7c ("A bracket holds "or" only where each alternative, supplied alone, keeps the claim's scope") | O13 |
| Manuscript 6.1 | 1, 5 | N10, N10b (CNN is first used in the title); N1 with E2 ("or the other term") for ConvNeXt | - |
| Manuscript 7.1 | 1 | N2c ("aims" made "aimed" without a Tense line) | - |
| Manuscript Methodology 56 | 8 | E2 ("No later group gives it again or refers to it"), E1 ("It is never a reference to another finding") | O2 |
| Manuscript Methodology 57 | 8 | E3 ("just" as a minimality claim) | O4 |
| Manuscript Methodology 67 | 1 | N1 with E2 (the cut of "slightly" is a section A break that the entry names) | - |
| Manuscript Results 5, 10, 16, 24, 26, 29 | 1, 2 | N2a with N6 ("markedly", "closely", "largely", "essentially", "essentially all", "clearly") | - |
| Manuscript 10.4 | 8 | E8 ("projection head" brought in undefined) | O11 |
| Manuscript 11.1 | 8 | E1 ("reads as a sentence there") | O7 |
| Manuscript 11.4 | 4, 7, 8 | N12 ("robust" for an estimate insensitive to the partition of the data is not reported), N5b ("reliable" is the draft's word for calibration); the false note by E2 | O2 |
| Manuscript 13.1 | 1 | N2c (the carried voice change of 1.2) | - |
| Manuscript 13.4 | 1, 2, 8 | N2a with N6 ("increasingly"), N2c (the present perfect); E1 for the replacement that is no sentence | O7 |
| Manuscript 13.9 | 1 | N2e (three items after semicolons in paragraph form) | - |
| Manuscript 13.11 | 1 | N2c (tense changes no entry names) | - |
| Manuscript 13.12 | 8 | E6 (a part is counted with the sentences other findings add) | O14 |
| Manuscript 13.13 | 4, 7 | N12, N5b (it carries 11.4) | - |
| Manuscript 13.17 | 1 | N2e (six metrics after a colon in paragraph form) | - |
| Manuscript 13.19 | 1, 2 | N2a with N6 ("largely") | - |
| Manuscript 13.20 | 1, 2, 8 | N2a with N6 ("comparatively little", "at most marginal"), N2f; E5 | O12 |
| Manuscript 13.21 | 1, 2 | N2a with N6 ("at most marginal") | - |
| Manuscript 13.22 | 1 | N2d (two ideas joined by "while") | - |
| Manuscript 14.6 | 1 | N2c (the Voice break of 7.5 carried to a second place) | - |
| Grant 1b | 8 | E4 (the Also line on "Clear antecedents" does not describe the passage) | O4 |
| Grant 1c | 8 | N9 (the opening "If the hypothesis holds" is kept in each part that holds a claim it governs) | O10 |
| Grant 2e | 4 | N5 ("serial scans" made "serial MRI studies" covers a narrower set) | - |
| Grant 2f | 1 | N8, N8b (the 35-word sentence is ended and named); N1 for "scans" | - |
| Grant 2h | 1 | N8, N8b (43 words) | - |
| Grant 3a | 8 | E8 ("hepatitis B virus" brought in undefined) | O11 |
| Grant 4a | 1, 8 | N8 (31 words); E8 ("80 percent power") | O8, O11 |
| Grant 7a | 1 | N8 (29 words made 32) | - |
| Grant 7b | 1, 8 | N2b, N8 (the finding names the length rule and a written sentence has 30 words); N4b ("matched") | O8, O9 |
| Grant 7d | 1 | N1 with E2 ("scans" for a study is a break the finding names) | - |
| Grant 8c | 8 | N4b ("a detection limit" made "the detection limit") | O9 |
| Grant 8g | 1 | N8, N8b (38 words) | - |
| Grant 8i | 1 | N8 (42 words), N2e | - |
| Grant 8j | 1 | N8 (31 and 43 words), N2e | - |
| Grant 11c | 1 | N2b, N8 (the first new sentence has 28 words) | - |
| Grant 11d | 1 | N2b, N8 (the second new sentence has 29 words) | - |
| Grant 11e | 1 | N2b, N8 (the first new sentence has 28 words) | - |
| Grant 11f | 1 | N2d (two independent claims joined) | - |
| Grant 12a | 1 | N8, N8b (27 words) | - |
| Grant 13a | 1 | N8, N8b (28 words) | - |
| Grant 14b | 1, 8 | N2d; E4 (the Also line on the "ongoing state" row does not describe the replacement) | O4 |
| Grant 16a | 1 | N8, N8b (32 words) | - |
| Grant 16b | 1 | N8, N8b (29 words) | - |
| Grant 16h | 4 | N5 (it carries 2e) | - |
| Grant 16j | 1 | N8, N8b (28 words) | - |
| Grant 16n | 1 | N2e (the list of 2f carried) | - |
| Grant 16o | 1 | N2d | - |
| Grant 16p | 8 | E8 ("80 percent power"); E6 | O11, O14 |
| Grant 16r | 1, 8 | N2d (alignment joined to blinding); E6 | O14 |
| Grant 16t | 1 | N8, N8b (32 words) | - |
| Grant 16u | 1 | N8, N8b (28 words) | - |
| Grant 16v | 1 | N2d (the level-2 exclusion and the level-1 analysis in one sentence) | - |
| Grant 16y | 8 | E6 (the part after the break holds more than one idea) | O14 |
| Grant 16z | 1 | N2d (the carried two-claim sentence of 14b) | - |
| Grant 17a | 8 | E4 (the section 0 rule on the en dash as an aside) | O4 |
| Gate condition 2, manuscript group 6 | 9 | N13c, N13b (CNN is first used in the title) | O15 |
| Gate condition 2, manuscript group 11 | 9 | N13e ("names a loss its finding does not show"; the line is contradicted by findings 11.1, 11.2 and 11.4) | O15 |
| Gate condition 2, manuscript group 14 | 9 | N13, N13d, N13e (the line restates the rule and names no cost) | O15 |
| Gate condition 2, grant groups 1 and 3 | 9 | N13 ("wrongly believes or does, or cannot do"), N13e | O15 |
| Gate condition 2, grant groups 5 and 9 | 9 | N13, N13b, N13e (group 9 also N13d) | O15 |
| Gate condition 2, grant group 15 | 9 | N13c, N13d (the cost named at paragraph 31 must hold there) | O15 |
| Gate condition 5, the tense entry at `b_implementation.tex:3` | 8 | E2 ("No later group gives it again or refers to it"), E1 | O2 |
| Gate condition 5, finding 5.2's instruction | 8 | E1 ("It is never an instruction") | O7 |
| Gate condition 5, the three places given twice | 8 | E2 | O2 |
| The group 9 heading under "Methodology" | 8 | `references/rules.md`, "Tense per section" (each entry stands under the row of its own section) | O3 |

Gate condition 6 is not a row: its failures concern the markers' commands, the grant marker prompts and 17 marks without a reason of their own, and no text of `/writing`. The closing report names them, as the brief says.

### C1 to C10 after the change

- C1: each row of fix 1's list is in the table above with the rewritten sentence that prevents it: N1, N2 with its items, N3, N4 and N4b for the "named rule" sentences, N8 to N8c for the length rows. The report's reading of the length rule is kept even by N8c, which states no number of words.
- C2: N6. Its second example group names "markedly", "largely", "essentially", "considerably", "repeatedly", "increasingly" and "predominantly", and its first sentence keeps "is one, listed there or not". N2a names "a word of size or degree" in the list. "Closely", "clearly", "moderate", "at most marginal", "comparatively little" and "far less pronounced" are read as words of size or degree.
- C3: manuscript 5.5 breaks N7b, 5.11 breaks N7 and N7b, 5.20 breaks N7c. Grant 2a breaks none of N7, N7b and N7c: its brackets ask for "the share of cases the author's source gives", and it stays allowed.
- C4: grant 2e and 16h break N5 ("serial MRI studies" covers the narrower set of MRI studies). Manuscript 11.4 and 13.13 break N5b; N12 makes "robust performance estimates" an exempt term, so the finding is no longer reported.
- C5: manuscript 5.1 and 6.1 break N10: the title at `main.tex:45` precedes the abstract at `main.tex:96`. The group 6 line, whose example rests on that claim, breaks N10b ("checked against every earlier use") and N13c.
- C6: manuscript 5.6 and 5.9 are covered by the row they name, under N11. Manuscript 3.3 is not covered: "recent studies" is not the phrase of the row "in recent years", and N11b says so. `a_problem_formulation.tex:1` "some patients" is not covered: patients are no published work (N11).
- C7: manuscript 11.4: N12 exempts "robust" for an estimate insensitive to the partition of the data, and "robust performance estimates" with a stratified 5-fold cross-validation against a single hold-out split is such an estimate. It is not reported.
- C8: each failing row has its operation in the table. The eight findings at grant paragraph 42 (2h, 8g, the group 11 finding, 12a, 13a, 16u, 16v, 16y) stay: O2 finds another finding or entry that quotes the same or overlapping words outside the forms for a split, 16u, 16v and 16y are split quotes, and the other five quote different words.
- C9: the eight lines are in the table, each with the sentence of "How you group them" it breaks. Manuscript group 1's line states a loss and gives `abstract.tex:5`, which becomes `sections/abstract/abstract.tex:5`, the place form of finding 1.4 (N13b). Grant group 2's line states "the reader cannot weigh the problem" and gives paragraph 34, where findings 2c and 2d stand. Both keep their losses and take the place form.
- C10: manuscript 1.3, 7.2, 8.1 and the nine list entries of 12.1 to 12.9 keep their place, passage, rule and replacement: their passage sentences run 19, 19 and 13 words (counted by splitting `8-run/manuscript-report.md` text at full stops), and N5 and N5b are met by 12.x because "model variants" names the five sizes the draft already calls variants. Grant 2a, 5a, 6a, 9a and 15a keep theirs: 2a's passage sentence has 24 words and its replacement already ends it in sentences of 17 and 22 words, with brackets for the share of cases that N7 and N7b ask for; 5a, 6a, 9a and 15a have passage sentences of 22, 14, 8 and 14 words. Two rows are asked in another form: manuscript 4.1 (a passage sentence of 40 words, and a replacement that keeps a sentence of 40 words) and manuscript 5.3 (a passage sentence of 26 words, and a replacement of 32 words) now end the long sentence in the replacement and name the length rule, as N8 and N8b ask. Their places, passages and the rules that cause the rest of their replacement stay.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| Fix 1, a replacement ends every break and writes none | DONE | N1 to N4b and N8 to N8c in `SKILL.md`, "A finding", replacement bullets. |
| Fix 2, size and degree words | DONE | N6 in the same place. |
| Fix 3, a frequency word | DONE | N7, N7b, N7c in the same place. |
| Fix 4, a new name | DONE | N5, N5b in the same place. |
| Fix 5, the first use | DONE | N10, N10b in `references/rules.md`, "Terms defined at first use". |
| Fix 6, two rows of "Vague language" | DONE | N11, N11b in `references/rules.md`, "Vague language". |
| Fix 7, "robust" | DONE | N12 in `references/rules.md`, "Replacements for flagged terms". |
| Fix 8, the last pass | DONE | O1 to O15 in `SKILL.md`, "The last pass"; N9 moved to the replacement bullets. |
| Fix 9, the group lines | DONE | N13 to N13e in `SKILL.md`, "How you group them". |
| Verify 1, the character-set check over the four files | DONE | `LC_ALL=C grep -n '[^ -~]' <the four files>` printed nothing; `echo "charset exit $?"` printed `charset exit 1` (grep found no match, so no non-ASCII character). |
| Verify 2, the glossary check | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`. |
| Verify 3, the spaced-dash grep | DONE | `grep -n -E '[^[:space:]] -{1,2} ' <the four files>` printed nothing; `echo "dash exit $?"` printed `dash exit 1`. |
| Verify 4, `git diff 1077fe4 skills/writing` read whole | DONE | `git diff --stat 1077fe4 skills/writing` printed ` skills/writing/SKILL.md | 76 ++++++++++++++++++++++----------------`, ` skills/writing/references/rules.md | 9 ++++-`, ` 2 files changed, 52 insertions(+), 33 deletions(-)`. Notes under the table. |
| Verify 5, new items and sentences read against the standards pages | DONE | See "Departures from the standards pages" below. |
| `metadata.version` | DONE | `grep -n 'version:' skills/writing/SKILL.md` prints `5:  version: "1.0.0"`. |
| `references/registers.md` | unchanged | `git diff 1077fe4 --quiet skills/writing/references/registers.md` exits 0. No fix of the brief belongs on that page. |

Notes on Verify 4:

- The worktree copy of the dispatch entry holds no base; `git rev-parse --short HEAD` printed `1077fe4`, the preparation commit, and the diff is read against it.
- Every changed sentence serves a fix of "What to build".
- `git diff -U0 1077fe4 skills/writing | grep '^+' | grep -v '^+++' | grep -n -E 'HCC|CNN|MRI|ConvNeXt|AUPRC|paragraph [0-9]+|\.tex:|main\.tex|8-run|step [0-9]|plan 3|ordo'` printed one line, `47:+- A `.docx` draft is read from paragraph 1.`, which is the dictated generic rule and names no part of a draft or plan.

### Departures from the standards pages

Sentences over about 20 words, counted on the added and changed lines (a word count by `python3 -I` that splits the added lines of `git diff -U0 1077fe4 skills/writing` at sentence ends and prints each sentence of 21 words or more; its output lists the sentences named below). Each stays because of the reason named.

- "It ends every break the passage holds: ..." (29 words) names the three pages the brief names.
- "It adds no claim or relation ... beyond the addition a rule the finding names asks for." (28 words) and "A word that sets a claim's scope ... unless a rule the finding names replaces it." (24 words) are existing sentences with three words changed.
- "A replacement that renames a thing for any other rule, ..." (29 words) carries the example and the limit "never a narrower or a wider one".
- "A word of the kind the prose standard's section A lists ..." (21 words) is the existing sentence. Its examples sentence (26 words) lists the example words.
- "The replacement of a word of frequency ..." (25 words) carries its three example words.
- "A split of a paragraph or of a sentence keeps a condition ..." (30 words) is the existing sentence widened to a sentence split, with its example.
- The group-line bullets (21, 23 and 25 words) each hold one condition and its limit.
- O2 (28 words), O3 (31 words), O4 (31 words), O5 (28 words), O6 (26 words), O9 (25 words), O11 (27 words), O12 (31 words) and O14 (26 words) each name one operation, how it is done and the part it applies in parentheses. O4, O9, O11, O12, O14 and O15 join two actions of one operation with "and" (quote and read, compare and give, list and find, list and read, write out and count and name, name and read), as the brief dictates the operation.
- The rules page sentences "A `.tex` draft is read from the main file's first line ..." (22 words), "The rows "many studies" and "some researchers" ..." (25 words) and the "robust" item (29 words) are one clause each of the dictated rule.
- Sentences of 21 to 23 words, within the standard's "roughly 20": the existing "delete" bullet widened to "a rule the finding names" (21), N7b (21), N8 (23), N13 (21), N13b (23), O1 (21) and O15 (22).
- The seven items of N2 end in semicolons as the file's other list items do; the semicolons are list punctuation, not running prose.
- The list of "A proposed replacement" bullets now holds N1 and N2 beside the existing "A passage that breaks two or more rules" sub-bullet "It has one replacement that ends every break." The two state the same requirement from two sides and both are kept as the brief states them.

## The terms

- **finding** (`docs/glossary.md`, "a passage of a draft that `/writing` reports as a break of a named rule, with its place, the quoted passage and a proposed replacement"): used in N1, N3, N4, N8 to N8c, N9, N13 to N13e and O1 to O15 in that sense ("the finding's rule line", "a rule the finding names"). Each use is a passage `/writing` reports.
- **place**: the glossary defines "place, of a defect" for `diagnose` and "place, of a point" for `session-retro`, neither of which is `/writing`'s. The text uses "place" for a finding's place, as "A finding" defines it before this change; the new uses (O1, O2, N13b) read it that way.
- **case**: N7 uses "cases" in its ordinary sense, the cases a claim holds in, as the sentence it replaces did. The glossary's **case** is a brief's example; it is not meant.
- **operation**: used for the items of "The last pass". The glossary uses the word inside **place, of a defect** and **other input** for `diagnose`; it defines no term "operation", and the new use does not change those entries.
- **kind**: the new text does not use the word as a term. The existing "A word of the kind ..." stays.
- **report**, **group**, **split**, **list**, **pass**: no glossary entry applies.

## The files

`wc -l`, run after the last edit:

```
252 skills/writing/SKILL.md
228 skills/writing/references/rules.md
 53 skills/writing/references/registers.md
369 .scratch/3-the-writing-base/agents/reviews/9-report.md
```

## Judgment calls the brief left open

- Fix 1 lead sentence. The brief asks for a replacement that ends every break the passage holds and whose text breaks none of the rules. N1 states the first and N2 the second, with the seven items as "Examples are these breaks:", so the list is a set of examples of the rule and the rule itself covers every other break.
- Fix 1, the length rule. N8 to N8c are three bullets, one rule each. The requirement that every sentence a replacement writes meets the length rule is carried by N2b under N2, so it is stated once and N8 holds the rest: the passage's long sentence is ended in the replacement, the finding names the rule, and no sentence is as long as one the report names. N8c states no number of words, as Decision 6 says.
- Fix 3. The frequency-word rule is a sub-bullet of "The replacement of a vague qualifier is the number or the specific claim." That bullet states the rule for another vague qualifier, so the brief's third clause is not repeated. The old bracket sentence "The bracket names the number, the share of cases the claim holds in, or the specific claim." is replaced by N7, N7b and the existing line "Where the draft gives neither, it is a bracket for the author."
- Fix 4. The exception "unless the named rule changes the name" keeps its words, as the brief says. N5 and N5b are sub-bullets of that bullet.
- Fix 6 and fix 5 are written as separate bullets, one rule each.
- Fix 8, O1. The old pass item "Each place is in its form ..." has no operation of its own in the brief's list. O1 states the place as "given in one of the forms", so finding the quoted words at the place needs the place in its form.
- Fix 8, O3. The brief names "A finding" for the part of the prompt O3 applies. "A finding" holds no rule that a tense-list entry stands under the row of its own section, and `references/rules.md`, "Tense per section", holds the rows, so O3 cites that section.
- Fix 8, O14. The brief's operation counts the sentences of each part. The old pass item also asked that each part "holds one idea", and grant 16y (a part with several ideas) rests on that. O14 adds "and name its ideas" so that the old requirement and that row stay covered.
- Fix 8, O2. "Outside the forms for a split" names the quoted splits of "A finding", so a split that quotes a sentence another finding gives is not read as a second giving.
- Fix 8, O4. The brief says "the named rule or table row". The text reads "the rule or table row the finding names", for a finding that names several rules.
- Fix 9. The place bullet N13b is a bullet of its own, since a line can state a loss and miss the place. The old sentence "That loss is why the group stands where it does." stays in the first bullet.
- The base of Verify 4 is `1077fe4`, as the table says.
- Examples. N6 lists the seven words the brief names for size and degree; "closely", "clearly", "moderate" and the like are read under N2a, "a word of size or degree included".

## Every user-visible change, before and after

`/writing` shows the user the review agent's report, so each change reaches the user through that report.

| Part | Before | After |
|---|---|---|
| Replacement text | Ends the named break only; may keep another break unnamed | Ends every break the passage holds and breaks no rule of the three pages; N2's examples are vague qualifiers, long sentences, unnamed tense or voice changes, two ideas, lists in paragraph form, relations with no limit and performative asides |
| Rules the replacement applies | "the named rule" | "a rule the finding names", so a rule named on a line of its own counts |
| Sentence length | A replacement stays within the length rule only when the finding names it | A replacement ends each over-long sentence of the passage whatever rule the finding names, and no sentence is as long as one the report names as over the rule |
| Vague qualifiers | Frequency words only are examples | Words of size or degree are also vague qualifiers |
| A frequency word | A bracket may name a number, a share or the specific claim, and may offer "or" | The replacement is the share or the count of cases; a bracket asks for no other quantity; "or" only where each alternative keeps the scope |
| A new name | The draft's name, except where the named rule renames | A rename by another rule covers the same set and is a word the draft does not use for another thing |
| First use of a term | A `.tex` draft "read as one document" | Read from the main file's first line, title included; a first-use claim is checked against every earlier use |
| "Vague language" | Each row is its phrase | "many studies" and "some researchers" also cover another noun for published work or its authors |
| "robust" | Exempt "as in robust estimator" | Exempt for an estimate or a method insensitive to outliers, to departures from the model's assumptions or to the partition of the data |
| A split | A condition is kept in each part among the paragraph-split forms | Kept in each part of a split of a paragraph or of a sentence |
| Group lines | Name a loss "as one of the group's own findings shows" | State the reader's wrong belief, act or inability, give the place of one finding where it happens, and a no-claim group names its cost at that place |
| The last pass | A list of sixteen things to check | Fifteen numbered operations, carried out for each finding in order, each saying how and naming the part it applies |

## Anything in the brief that was wrong or impossible

- Decision 3's example lines do not all hold in the draft. The group 5 example gives paragraph 40, and the only finding of grant group 5 stands at paragraph 42 (`awk '/^=== 5\./{f=1} /^=== 6\./{f=0} f' 8-run/grant-report.md | grep '^Place:'` printed `Place: paragraph 42`). The group 9 example gives paragraph 31 for "we" and "the applicant"; a `grep -o -i -E '\b(we|our|us|the applicant)\b'` over the printed paragraphs shows paragraph 31 holds "the applicant" twice and no "we", paragraph 46 holds "The applicant" and no "we", and paragraph 35 holds both, though group 9's findings stand at paragraphs 31 and 46. The group 15 example cost, "the reader learns who acts only at the end of the sentence", does not hold at paragraph 31: the sentence reads "Computing is provided by the host institution at no cost, so none is requested.", the same point `8-report.md` condition 2 makes. The rule text of fix 9 carries none of these examples, and "The loss holds in the draft's own text and data" governs them, so the skill is unaffected; the examples are not to be copied into a later brief.
- Fix 5 as ruled makes the title the first use. A finding on CNN or MRI then stands at `main.tex:45`, and its replacement defines the term in a title or names the definition as a fact for the author. That is the consequence of the dictated sentence.
- The expected result of C4 for manuscript 11.4 and 13.13 is the sentence on names. After fix 7 those two are not reported at all, since "robust performance estimates" is exempt; N5b is the second guard if a draft's "robust" is reported and renamed.
- The old pass item "Each place is in its form" and the item "The replacement of a vague qualifier takes one of the forms ..." have no operation in the brief's list. The first is in O1; the second is carried by O9, O4 and O13 together (a word dropped or changed needs the rule that asks for it, the exceptions of the section are read, and a bracket with "or" is read alone). Both stay stated once in "A finding".
- Gate condition 6 is outside `skills/writing/`, as the brief says, and is not changed here.

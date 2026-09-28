# Step 3 records: the rules of the three rebuild: writing files and where each stands

One record per `rebuild: writing` row of `docs/academic-coverage.md`, in the order of the coverage list. Each record names the source file, under `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper/references/`, and the lines read. Its table has one row per rule of the source file: the rule, its source lines, and where it stands now. A place is a page of `skills/writing/references/` with the line that states the rule whole, a check of `skills/writing/templates/check_prose.py` with its docstring line, a section of `skills/writing/references/prose-standard.md` with its line, or "Not carried" with the reason. Every heading and every non-blank source line, except code fence markers, table separator rows and thematic breaks, is in exactly one row. A ruling named by its number alone is one of `agents/briefs/3-cases.md`; one marked "repair round 1" is one of `agents/briefs/3-round-1.md`. Each record's count line gives its rows and the source lines they list.

## Record 1: `academic_writing_style.md`

Coverage row, line 82. Lines read: 1-188, the whole file.

Rows: 74. Source lines listed: 135.

| Rule | Source lines | Where it stands |
|---|---|---|
| The file's title and the agents that use it | 1, 3 | Not a rule: the page's opening paragraph names its readers (ruling 4(vii)), `academic-prose.md`, line 3 |
| The most specific term | 5, 7, 8 | `academic-prose.md`, line 7 |
| Technical terms defined at first use | 9 | `academic-prose.md`, line 8 |
| A pronoun only with a clear antecedent | 10 | `academic-prose.md`, line 9 |
| Filler words and redundant phrases cut | 12, 13 | `academic-prose.md`, line 11, naming section A at `prose-standard.md`, line 24; the redundant phrases are the wordy forms table under Wordy forms |
| One idea per sentence, or clearly connected ideas | 14 | `academic-prose.md`, line 10 (ruling 4(ii)) |
| Short sentences preferred for complex ideas | 15 | Not carried as its own rule (ruling 4(iii)): section E's limit is kept, `prose-standard.md`, line 64, named at `academic-prose.md`, line 12 |
| Claims based on evidence, not opinion | 17, 18 | `academic-prose.md`, line 13 |
| Hedging for uncertain claims | 19 | `academic-prose.md`, line 14 |
| Limitations and alternative interpretations acknowledged | 20 | `academic-prose.md`, line 15 |
| Full forms | 22, 23 | `academic-prose.md`, line 16 |
| Formal academic vocabulary, colloquialisms and slang kept for informal writing | 24 | `academic-prose.md`, line 17 |
| Third person unless discipline conventions allow first person | 25 | `academic-prose.md`, line 18 (ruling 4(i)) |
| Sciences register | 29, 31, 32, 33, 34 | Not carried: the coverage row keeps Engineering and CS of the six registers |
| Social sciences register | 37, 39, 40, 41, 42 | Not carried: the coverage row keeps Engineering and CS of the six registers |
| Humanities register | 45, 47, 48, 49, 50 | Not carried: the coverage row keeps Engineering and CS of the six registers |
| Engineering and CS register: formal, problem and solution, specification-precise | 27, 53, 55 | `academic-prose.md`, line 24 |
| Engineering and CS voice: passive for methods, active for contributions | 56 | `academic-prose.md`, line 25 (ruling 5, beside section E's passive rule, `prose-standard.md`, line 63) |
| Engineering and CS terminology: technical specifications, performance metrics | 57 | `academic-prose.md`, line 26 |
| Engineering and CS example sentence | 58 | `academic-prose.md`, line 27 |
| Education register | 61, 63, 64, 65, 66 | Not carried: the coverage row keeps Engineering and CS of the six registers |
| Medicine and health register | 69, 71, 72, 73, 74 | Not carried: the coverage row keeps Engineering and CS of the six registers |
| Hedging scale, weak: may, might, could, possibly | 77, 79, 80, 82 | `academic-prose.md`, line 35 |
| Hedging scale, moderate: suggests, indicates, appears | 83 | `academic-prose.md`, line 36 |
| Hedging scale, strong: demonstrates, establishes, confirms | 84 | `academic-prose.md`, line 37 |
| Hedge results that need replication | 86, 87 | `academic-prose.md`, line 43 |
| Hedge causal claims from correlational data | 88 | `academic-prose.md`, line 44 |
| Hedge generalizations from limited samples | 89 | `academic-prose.md`, line 45 |
| Hedge interpretations with alternative explanations | 90 | `academic-prose.md`, line 46 |
| Do not hedge reported data | 92, 93 | `academic-prose.md`, line 52 |
| Do not hedge a method | 94 | `academic-prose.md`, line 53 |
| Do not hedge established facts | 95 | `academic-prose.md`, line 54 |
| Transitions of addition | 97, 99, 100 | `academic-prose.md`, line 62 |
| Transitions of contrast | 102, 103 | `academic-prose.md`, line 63 |
| Transitions of cause and effect | 105, 106 | `academic-prose.md`, line 64 |
| Transitions of example | 108, 109 | `academic-prose.md`, line 65 |
| Transitions of sequence | 111, 112 | `academic-prose.md`, line 66 |
| Transitions of summary | 114, 115 | `academic-prose.md`, line 67 |
| Transitions of concession | 117, 118 | `academic-prose.md`, line 68 |
| Paragraph shape: topic sentence first | 120, 122, 123 | `academic-prose.md`, line 74 |
| Paragraph shape: evidence | 124 | `academic-prose.md`, line 75 |
| Paragraph shape: explanation | 125 | `academic-prose.md`, line 76 |
| Paragraph shape: link | 126 | `academic-prose.md`, line 77 |
| Paragraph shape example, in ASCII (kappa, no em dashes) | 128, 129 | `academic-prose.md`, line 81 |
| Wordy: "in order to" | 136 | `academic-prose.md`, line 96, naming section C at `prose-standard.md`, line 39 |
| Wordy: "due to the fact that" to "because" | 131, 133, 134, 137 | `academic-prose.md`, line 87 |
| Wordy: "a large number of" to "many" | 138 | `academic-prose.md`, line 88: the source's "many" replaced with "the number itself" naming section A, since "many" is on section A's vague list, `prose-standard.md`, line 26 (ruling 1) |
| Wordy: "at the present time" to "currently" or "now" | 139 | `academic-prose.md`, line 89 |
| Wordy: "it is important to note that" to "notably" | 140 | `anti-patterns.md`, line 16, the full form, which section C and the `throat-clearing` check do not hold, pointed at from `academic-prose.md`, line 96; the replacement "notably" is not carried, since the source's own throat-clearing table deletes the opener (source line 84) and section C deletes openers |
| Wordy: "in the event that" to "if" | 141 | `academic-prose.md`, line 90 |
| Wordy: "has the ability to" to "can" | 142 | `academic-prose.md`, line 91 |
| Wordy: "with regard to" to "regarding" or "about" | 143 | `academic-prose.md`, line 92 |
| Wordy: "in spite of the fact that" to "despite" or "although" | 144 | `academic-prose.md`, line 93 |
| Wordy: "conduct an investigation of" to "investigate" | 145 | `academic-prose.md`, line 94 |
| Vague: "many studies" to named, cited studies | 147, 148, 150 | `academic-prose.md`, line 102 |
| Vague: "a significant impact" to the measured figure | 151 | `academic-prose.md`, line 103 |
| Vague: "in recent years" to the year or span | 152 | `academic-prose.md`, line 104 |
| Vague: "some researchers" to names with citations | 153 | `academic-prose.md`, line 105 |
| Vague: "it is well known that" to a citation or nothing | 154 | `academic-prose.md`, line 106 |
| Tense: literature review findings, past | 156, 157, 159 | `academic-prose.md`, line 112 |
| Tense: literature review ongoing state, present | 160 | `academic-prose.md`, line 113 |
| Tense: method, past | 161 | `academic-prose.md`, line 114 |
| Tense: results, past | 162 | `academic-prose.md`, line 115 |
| Tense: discussion, present | 163 | `academic-prose.md`, line 116 |
| Tense: conclusion, present or future | 164 | `academic-prose.md`, line 117 |
| zh-TW register: written language | 166, 168, 169 | Not carried: the coverage row keeps "not zh-TW conventions" |
| zh-TW register: active voice | 170 | Not carried: the coverage row keeps "not zh-TW conventions" |
| zh-TW register: short sentences | 171 | Not carried: the coverage row keeps "not zh-TW conventions" |
| zh-TW register: "this study" rather than "we" | 172 | Not carried: the coverage row keeps "not zh-TW conventions" |
| zh-TW academic expressions | 174, 175, 177, 178, 179, 180, 181, 182 | Not carried: the coverage row keeps "not zh-TW conventions" |
| zh-TW translationese: "was found to be" | 184, 185 | Not carried: the coverage row keeps "not zh-TW conventions" |
| zh-TW translationese: "This is because" | 186 | Not carried: the coverage row keeps "not zh-TW conventions" |
| zh-TW translationese: "In the aspect of" | 187 | Not carried: the coverage row keeps "not zh-TW conventions" |
| zh-TW translationese: "It is worth being pointed out that" | 188 | Not carried: the coverage row keeps "not zh-TW conventions" |

## Record 2: `writing_judgment_framework.md`

Coverage row, line 106. Lines read: 1-59, the whole file.

Rows: 29. Source lines listed: 39.

| Rule | Source lines | Where it stands |
|---|---|---|
| The file's title and what it complements | 1, 3 | Not a rule: the page's opening paragraph names its readers (ruling 4(vii)), `judgment.md`, line 3 |
| The clarity test: does the text make sense without the paragraph | 5, 7 | `judgment.md`, line 7 |
| Nothing lost: delete the paragraph | 9 | `judgment.md`, line 11 |
| Context lost: a supporting paragraph, kept short | 10 | `judgment.md`, line 12 |
| The argument breaks: a load-bearing paragraph, the most careful writing | 11 | `judgment.md`, line 13 |
| Load-bearing paragraphs get several drafts, supporting ones one, since equal weight fails the test | 13 | `judgment.md`, line 15 (ruling 4(vi)) |
| The reader's four questions, answerable at any point of a guided text | 15, 17 | `judgment.md`, line 19 |
| Where am I (section structure, signposting) | 19 | `judgment.md`, line 21 |
| Why am I here (connection to the research question) | 20 | `judgment.md`, line 22 |
| What should I take away (the point of the section) | 21 | `judgment.md`, line 23 |
| Where am I going next (transition logic) | 22 | `judgment.md`, line 24 |
| A text failing any question is revised, however accurate | 24 | `judgment.md`, line 26 |
| Hard sciences voice and credibility | 26, 28, 30 | `judgment.md`, line 32, with the passive voice a discipline trusts reconciled with section E at `judgment.md`, line 38 (repair round 1, ruling 13) |
| Social sciences voice and credibility | 31 | `judgment.md`, line 33 |
| Humanities voice and credibility | 32 | `judgment.md`, line 34 |
| Engineering voice and credibility | 33 | `judgment.md`, line 35 |
| Medical voice and credibility | 34 | `judgment.md`, line 36 |
| The wrong-voice test | 36 | `judgment.md`, line 40 |
| Introduction: why care, hook with a consequence or gap | 38, 40, 42 | `judgment.md`, line 46 |
| Literature review: what is missing, build to the gap | 43 | `judgment.md`, line 47 |
| Method: can I trust the results, show rigour and limitations | 44 | `judgment.md`, line 48 |
| Results: what was found, lead with the finding, not the statistical test | 45 | `judgment.md`, line 49 |
| Discussion: what it means, connect to the gap and state the delta | 46 | `judgment.md`, line 50 |
| Conclusion: what to remember, one sentence of contribution | 47 | `judgment.md`, line 51 |
| Revision matrix: "Unclear" | 49, 51, 53, 55 | Not carried: the coverage row gives the revision decision matrix to `rebuttal` |
| Revision matrix: "Missing reference" | 56 | Not carried: the coverage row gives the revision decision matrix to `rebuttal` |
| Revision matrix: "Wrong method" | 57 | Not carried: the coverage row gives the revision decision matrix to `rebuttal` |
| Revision matrix: "Not novel enough" | 58 | Not carried: the coverage row gives the revision decision matrix to `rebuttal` |
| Revision matrix: "Too long" | 59 | Not carried: the coverage row gives the revision decision matrix to `rebuttal` |

## Record 3: `writing_quality_check.md`

Coverage row, line 107. Lines read: 1-173, the whole file.

Rows: 39. Source lines listed: 123.

| Rule | Source lines | Where it stands |
|---|---|---|
| The file's title and purpose: rules for good prose whoever wrote it | 1, 3, 5 | Not a rule: the page's opening paragraph states its scope, which names no author, `anti-patterns.md`, line 3 |
| Design boundary: better prose, not detector evasion | 7 | Not a rule: it states the source skill's aim, and no page carries a detector rule |
| The drafting steps that use the checklist | 9 | Not a rule: the page's opening paragraph names its readers (ruling 4(vii)), `anti-patterns.md`, line 3 |
| Flagged terms: not banned, each checked as the most precise word | 13, 15 | `prose-standard.md`, line 28, found by the check `flagged`, `check_prose.py`, line 90, named at `anti-patterns.md`, line 42 |
| The flagged-term list | 17, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45 | `prose-standard.md`, line 28; the "why it's flagged" and "better alternatives" columns are not carried (ruling 4(iv)); line 40's "paradigm shift" exception is at `anti-patterns.md`, line 21 |
| Standard terminology of the discipline is exempt | 47, 49 | `prose-standard.md`, line 28 |
| The exemption's four examples | 50, 51, 52, 53 | `anti-patterns.md`, line 21 |
| Em dash limit of 3 per paper, with its reason | 57, 59, 60, 61 | Not carried: the prose standard's zero is stricter (brief item 3), `prose-standard.md`, line 13 |
| Em dash fix: commas, parentheses or separate sentences | 62 | `prose-standard.md`, line 13, found by the check `dash-aside`, `check_prose.py`, line 70 |
| Quotations keep their original punctuation | 63 | `academic-prose.md`, line 121 |
| Semicolons at most 2 per 1000 words, a full stop instead | 65, 66, 67, 68 | `prose-standard.md`, line 33, found by the check `semicolons`, `check_prose.py`, line 85; the fix, a kept semicolon joining closely related parallel structures and any other becoming a full stop, is at `anti-patterns.md`, line 44 (repair round 1, ruling 5) |
| No two consecutive colon-and-list paragraphs | 70, 71, 72, 73 | `prose-standard.md`, line 34, found by the check `colon-lists`, `check_prose.py`, line 104; the fix, one consolidated list or a list of fewer than three items in the prose within section D, is at `anti-patterns.md`, line 45 (repair round 1, ruling 6) |
| Throat-clearing openers deleted | 77, 79, 81 | `prose-standard.md`, line 39 |
| The throat-clearing phrases the script's list holds | 83, 84, 85, 87, 88, 89, 90, 92, 93, 94 | `prose-standard.md`, line 39, found by the check `throat-clearing`, `check_prose.py`, line 88; each phrase's own fix is not repeated, since the ones the script finds are named and section C deletes the opener (brief item 3); line 84's contracted "It's important to note that" is the form section C and the script hold, and the full form is at `anti-patterns.md`, line 16 |
| "In today's rapidly evolving" | 86 | `anti-patterns.md`, line 15 |
| "As a matter of fact" | 91 | `anti-patterns.md`, line 17 |
| Meta-commentary: no sentence describing what the text does | 96, 98 | `prose-standard.md`, line 41 |
| "This section will discuss" | 99 | `anti-patterns.md`, line 19 |
| "The following paragraph examines" | 100 | `anti-patterns.md`, line 20 |
| "We now turn our attention to" | 101 | `anti-patterns.md`, line 18 |
| The Introduction's roadmap sentence is kept | 103 | `anti-patterns.md`, line 36 |
| Forced groups of three | 107, 109, 110, 111, 112 | `anti-patterns.md`, line 9, naming section D, `prose-standard.md`, line 47 (ruling 3) |
| Uniform paragraph length | 114, 115, 116, 117 | `anti-patterns.md`, line 10, naming section D, `prose-standard.md`, line 49; the example "a 2-sentence paragraph after a 10-sentence paragraph" is not carried, since a 10-sentence paragraph breaks section D's "under roughly four sentences" (ruling 3) |
| Synonym cycling | 119, 120, 121, 122 | `anti-patterns.md`, line 11, naming section D, `prose-standard.md`, line 50; "per section" is not carried, since section D's one term per concept on the whole page is stricter (ruling 2) |
| Binary contrast at most 2 per paper | 124, 125, 126, 127 | `prose-standard.md`, line 51, the limit; the one-sentence form is found by the check `contrast`, `check_prose.py`, line 98, only when a comma or "but" joins it ("It's not about X, it's about Y"), named at `anti-patterns.md`, line 47; the one-sentence form joined by the source's dash, a colon or a semicolon, which the check does not count, is at `anti-patterns.md`, line 14 (landing); the two-sentence form "Not X. Y." of source line 125, which the check does not find, is at `anti-patterns.md`, line 13 (repair round 1, ruling 2) |
| Mirror structure | 129, 130, 131, 132 | `anti-patterns.md`, line 12, naming section D, `prose-standard.md`, line 52 (ruling 3) |
| Sentence length varies | 136, 138, 139 | `prose-standard.md`, line 64 |
| Five or more consecutive sentences of a narrow length range flagged | 141, 142 | `check_prose.py`, line 94, the check `equal-length`, which flags a spread of at most 2 words, named at `anti-patterns.md`, line 48; a run within a wider narrow range, such as the source's 20 to 25 words, is judged by hand at `anti-patterns.md`, line 22 (repair round 1, ruling 4) |
| Fixes for a run of equal-length sentences | 144, 145, 146, 147 | `anti-patterns.md`, line 23, as alternatives, with source line 146's condition "if the pattern is monotonously short" (ruling 4(v); landing) |
| Abstract: moderate variation | 149, 150 | `anti-patterns.md`, line 27 |
| Introduction: high variation | 151 | `anti-patterns.md`, line 28 |
| Literature review: moderate variation | 152 | `anti-patterns.md`, line 29 |
| Methods: low variation acceptable | 153 | `anti-patterns.md`, line 30, the least variation of the sections with section E's rule still holding (repair round 1, ruling 8) |
| Results: moderate variation | 154 | `anti-patterns.md`, line 31 |
| Discussion: highest variation | 155 | `anti-patterns.md`, line 32 |
| Apply the checklist while drafting each section | 159, 161, 162 | Not carried: `/writing` reports each problem with its line (brief item 3, plan ruling, question 2) |
| A full-paper sweep before handoff as the fallback | 164, 165 | Not carried: `/writing` reports each problem with its line (brief item 3, plan ruling, question 2) |
| Violations scored per category | 167, 168, 169, 170, 171 | Not carried: `/writing` reports each problem with its line (brief item 3, plan ruling, question 2) |
| Scores not reported, issues fixed silently | 173 | Not carried: `/writing` reports each problem with its line (brief item 3, plan ruling, question 2) |

# Step 3, second run: the case reports read against expected.md

Each of the eight case reports of the second run (`3-writing-<draft>-run-2.md`, skill at tag v8.1.0-rc.2) was read against every row of its section of `cases/expected.md`. A break row is met when the report places the passage at the row's place under the row's group and names each other rule the row names. A finding at a passage no break row lists is a report in a passage the tables expect nothing for; for each, the reading says whether the draft holds that break by the rule's own words (a fault of the case file) or the report applied the rule beyond its words (a fault of the skill).

The gate's part on the case reports is not met. Two of the eight reports (social `.tex` and social `.docx`) meet every break row. The other six miss a break, place a break in another group or leave out a named second rule, and all eight report in passages the tables list as clean.

## engineering, .tex (`3-writing-engineering-tex-run-2.md`)

Missed breaks:

- 0. Hard rules / No repeated construction, the four "We chose ... because" sentences (`sections.tex:11`, `:47`, `:117`, `:225`). The report gives this group to another shape, `main.tex:29` and `:37`.
- Paragraphs / First sentence states the point, `sections.tex:53`.
- Common style errors / Tense per section, the Conclusion (`sections.tex:274`).
- Reader's path / Reader's four questions, the Implementation (`sections.tex:1`). The report places this rule on the Discussion instead.

Found under another group:

- D. Structure / No mirror structure: named as a second rule of the No repeated construction finding at `main.tex:29` and `:37`.
- E. Sentence shapes / Cold opens, `sections.tex:139`: named under D. Structure / No synonym cycling ("the tail").
- Precision / Most specific term, `sections.tex:19`: reported under Common style errors / Vague phrase.
- Common style errors / Vague phrase, `sections.tex:31`: reported under Paragraphs / Claim with evidence or citation, naming Vague phrase.
- Engineering and CS / What the reader looks for, the Latency Method: named as a second rule at `sections.tex:117` under Vague phrase. The place is inside the section, so the break is found.

Second rule not named: the five dash rows (`sections.tex:171` to `:179`) name no B. Punctuation / Em dash and dash-as-aside; `:223` names no Paragraphs / Claim with evidence or citation; `:13` names no Engineering and CS / Register; `:103` names no Engineering and CS / Terminology; `:19` names no Engineering and CS / Register. The row for `:209` asks for B. Punctuation / ASCII throughout, but `->` is ASCII, so that row is wrong.

Found where the first run missed them: D. Structure / Vary paragraph length (`main.tex:15`), the run of five 7-word sentences (`sections.tex:81`, `:83`) and Objectivity / Limitations and alternative interpretations (the Discussion).

Reports in passages the tables do not list:

- `sections.tex:91`, `:125`, `:127`, No synonym cycling ("the gap", "the gain", "the tail" for one figure): the draft holds the break. `:91` is a clean row's paragraph (Vague qualifiers, Transitions).
- `sections.tex:117`, Vague phrase, no offered load figure: the draft holds the break.
- The Discussion under Reader's four questions (paragraphs on the harness and its files with no tie to the research question): the draft holds the break.

## engineering, .docx (`3-writing-engineering-docx-run-2.md`)

Missed breaks:

- D. Structure / Vary paragraph length, paragraphs 5 to 10.
- D. Structure / No mirror structure, paragraphs 11 and 15.
- Objectivity / Limitations and alternative interpretations, the Discussion.
- Paragraphs / First sentence states the point, paragraph 45.
- Common style errors / Tense per section, the Conclusion (paragraph 146).
- Reader's path / Reader's four questions, the Implementation (paragraph 19).

Found under another group: paragraph 31 stands under D. Structure / Paragraphs cover one idea, naming Concision / One idea per sentence; paragraph 77 names What the reader looks for as a second rule of No repeated construction, inside the Latency Method, so that break is found.

Second rule not named: the five dash rows as in the `.tex` report; paragraph 130 (Claim with evidence); paragraph 25 (Register); paragraph 28 (Register). Paragraph 123: the row is wrong, as in the `.tex` report.

Found where the first run missed them: No repeated construction (paragraphs 24, 42, 77, 131) and the run of five 7-word sentences (paragraphs 59 and 60).

Reports in passages the tables do not list:

- Paragraphs 46 and 78, No repeated construction ("only X, which limited the result to that Y"): the draft holds the break.
- Paragraph 81, No synonym cycling ("the tail"): the draft holds the break.

## medicine, .tex (`3-writing-medicine-tex-run-2.md`)

Missed break: Medicine and Health / What the reader looks for, Cohort Methods (`sections.tex:1`). The first run missed it too.

Reports in passages the tables do not list:

- `main.tex:31`, Claims rest on evidence: "The trial had one limitation", while `sections.tex:25` names a second limitation that covers the trial. The draft holds the break; the passage is in the Limitations clean row.
- `sections.tex:17`, Limitations and alternative interpretations: the thrombosis result has no alternative interpretation. The rule asks the draft to acknowledge alternative interpretations of its results, and the clean row counts one for the whole draft. The rule's words do not settle whether one alternative for the whole draft is enough, so this is not decided by reading.
- `sections.tex:29`, Clarity test, the binary-contrast clean row's paragraph: a one-sentence paragraph that repeats results. The draft holds the break.

The agent ran `cat -n`, `grep -c`, `grep -n`, `wc -w` and an inline `python3 -I -c` sentence splitter on the draft files, which its prompt does not allow ("run only `LC_ALL=C grep -n '[^ -~]' <file>`"). All are reads, and no file was changed. The first run's medicine `.tex` agent did the same.

## medicine, .docx (`3-writing-medicine-docx-run-2.md`)

Missed break: What the reader looks for, Cohort Methods.

Second rule beyond the row: paragraph 19 also names Medicine and Health / Register. The rule's words ("clinically precise") fit, so the row is short of a rule.

Reports in passages the tables do not list: paragraph 30 (Limitations, as in the `.tex` report, not decided by reading); paragraph 2, Vague phrase ("showed the same direction"), the draft holds the break; paragraph 36, Clarity test, as in the `.tex` report.

## sciences, .tex (`3-writing-sciences-tex-run-2.md`)

Found under another group: Sciences / Voice, `main.tex:27`, stands under D. Structure / No synonym cycling ("The researchers" against "We"), naming Voice. The authors as a concept with two names is a reading of the synonym rule beyond its usual case; the rule's words ("one term per concept") allow it.

The other three break rows are met with their named rules.

Reports in passages the tables do not list:

- No synonym cycling at `main.tex:43` ("the width effect"), `sections.tex:15` ("the number of species in a plot"), `:23` and `:27` ("the gain"): the draft holds the break. `:23` is in the Limitations clean row and `:27` is the binary-contrast clean row.
- Passive voice, `main.tex:33`, twice: the draft holds the break.
- Claims rest on evidence, `sections.tex:25` (the semicolon clean row): the 16 species were for plots wider than 5 m. The draft holds the break.
- Evidence followed by what it means, `main.tex:47`: the draft holds the break.
- Vague phrase, `sections.tex:11` ("late summer", "most of the activity"): the draft holds the break. The sentence was added at the landing of the repair round.
- Reader's four questions, `sections.tex:3`: the activity survey has no stated tie to the research question. The draft holds the break.

## sciences, .docx (`3-writing-sciences-docx-run-2.md`)

Missed break: Reader's path / So what per section, the Activity Method. The report places What the reader looks for there on its own, under the register's group.

Found under another group: paragraph 28 stands under Formality / No colloquial words, naming Clarity test and Register; paragraph 11 stands under No synonym cycling, naming Voice.

Reports in passages the tables do not list:

- No repeated construction at paragraphs 18, 21 and 33 (an observation, ", so" and an inference): against the whole-draft clean row. Three sentences of a common shape; the rule's words ("a sentence shape that recurs across ... sections is a template") fit, so the draft holds the break.
- Vague qualifier, paragraph 27 ("most"): the draft holds the break.
- No synonym cycling at paragraphs 19, 32, 35: the draft holds the break.
- Claims rest on evidence at paragraph 12 (the Voice clean row: 100 m without a citation) and paragraph 34 (the semicolon clean row): the draft holds the break.
- Transitions, paragraph 29; Reader's four questions, paragraph 23: the draft holds the break.

## social, .tex (`3-writing-social-tex-run-2.md`)

All four break rows are met, each with the second rules its row names.

Reports in passages the tables do not list:

- No repeated construction at `main.tex:17`, `:41`, `sections.tex:17`, `:21`: four paragraph closers "<subject> thus <conclusion>". The draft holds the break, against the whole-draft clean row. All four sentences were written as fixes at the landing of the repair round.
- Plain prose only, `sections.tex:35` (the semicolon clean row): the draft holds the break.
- Cold opens at `sections.tex:33` (the Limitations clean row's alternative interpretation) and `:39` (the binary-contrast clean row): the draft holds the break.
- No synonym cycling `main.tex:15`; Claims rest on evidence `main.tex:8`; First sentence states the point and Tense per section `main.tex:39` ("suggests" in Results); Clarity test `main.tex:43`: the draft holds each break.

## social, .docx (`3-writing-social-docx-run-2.md`)

All four break rows are met. Paragraph 29 also names Paragraphs / Evidence followed by what it means, which the rule's words fit.

Reports in passages the tables do not list: the four "thus" closers (paragraphs 6, 18, 28, 30) as in the `.tex` report; Plain prose only at paragraph 37 (the semicolon clean row); Cold opens at paragraph 39 (the binary-contrast clean row); Passive voice at paragraph 13; First sentence states the point at paragraph 17. In each, the draft holds the break.

## What the reading shows

- **Skill misses.** Still missed: Medicine and Health / What the reader looks for in both medicine runs; in the engineering runs Tense per section, Reader's four questions on the Implementation and First sentence states the point in both, and in the `.docx` also Vary paragraph length, No mirror structure and Limitations. A whole-draft or section rule found in one form of a draft is missed in the other form in four cases.
- **Second rules.** The engineering runs still leave out the second rule on the five dash rows and on three single rows.
- **Case files.** Most reports in passages the tables list as clean are breaks the draft holds by the rule's own words. The four "thus" closers of the social draft and the sciences "late summer" sentence were written as fixes at the landing of the repair round, and they break rules the clean rows say the drafts keep.
- **Against the first run.** Social `.tex` and `.docx` now meet every break row. The engineering runs found five whole-draft or section breaks they missed before.

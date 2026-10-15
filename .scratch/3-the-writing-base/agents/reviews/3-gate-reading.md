# Step 3, the case reports read against expected.md

Each of the eight case reports (`3-writing-<draft>.md`) was read against every row of its section of `cases/expected.md`. A break row is met when the report places the passage at the row's place under the row's group and names each other rule the row names. Any finding at a passage no break row lists is a report in a passage the tables expect nothing for. Below each such finding is a reading of whether the draft holds that break by the rule's own words, which makes it a fault of the case file, or whether the report applied the rule beyond its words, which makes it a fault of the skill.

The gate's part on the case reports is not met: every report misses a break, places a break in another group, leaves out a named second rule, or reports in passages the tables list as clean.

## engineering, .tex (`3-writing-engineering-tex.md`)

Missed breaks:

- D. Structure / No mirror structure, `main.tex:27` and `:35`.
- Objectivity / Limitations and alternative interpretations, the Discussion (`sections.tex:129`).
- Paragraphs / First sentence states the point, `sections.tex:53`.
- Common style errors / Tense per section, the Conclusion (`sections.tex:274`).
- Reader's path / Reader's four questions, the Implementation (`sections.tex:1`).
- Engineering and CS / What the reader looks for, the Latency Method (`sections.tex:107`).

Found under another group: `sections.tex:19` "The benchmark ran on a modern server." is reported under Common style errors / Vague phrase, where the row expects Precision / Most specific term. Both rules' words fit the passage, so the row is the fault: it names one group where two apply.

Second rule not named: the five dash rows (`sections.tex:171` to `:179`) name no "B. Punctuation / Em dash and dash-as-aside"; `:223` names no "Paragraphs / Claim with evidence or citation"; `:13` names no "Engineering and CS / Register". `:209` names no "B. Punctuation / ASCII throughout", which the row asks for, but `->` is ASCII, so that row is wrong.

Reports in passages the tables do not list:

- `sections.tex:119`, "queue size" against "queue depth": the draft holds the break (No synonym cycling).
- `main.tex:8`, "99th percentile latency" defined only at `sections.tex:225`: the draft holds the break (Term defined at first use).
- `main.tex:31`, the correctness-proof paragraph under Clarity test: the draft holds the break; nothing later uses it.

## engineering, .docx (`3-writing-engineering-docx.md`)

Missed breaks: the six of the `.tex` report, and also 0. Hard rules / No repeated construction (the four "We chose ... because" sentences), D. Structure / Vary paragraph length (paragraphs 5 to 10) and E. Sentence shapes / Sentence length, five consecutive sentences (paragraphs 59 and 60).

Found under another group: paragraph 28, as in the `.tex` report.

Second rule not named: the dash rows, paragraph 130 and paragraph 25, as in the `.tex` report.

Reports in passages the tables do not list:

- Paragraph 64, "Creating them therefore took 6 percent of each run." under Transitions: this is the Transitions clean row. The report is right: a count of 248 threads does not give 6 percent, so the clean row holds the break.
- Paragraph 64, under First sentence states the point: the draft holds the break. Its last sentence, "Thread creation alone thus explains only part of the 24 percent gap.", was added at the landing of step 2.
- Paragraph 66, named as a second rule under Sentence length: the draft holds the break. Its last sentence was added at the landing of step 2.
- Paragraph 93, "allocates" against "creates": the draft holds the break.
- Paragraph 13, the correctness-proof paragraph: as in the `.tex` report.
- Paragraphs 98 and 128 name a second rule the rows do not name (Claim with evidence, Sentence length): both readings hold by the rules' words.

## medicine, .tex (`3-writing-medicine-tex.md`)

Missed break: Medicine and Health / What the reader looks for, Cohort Methods (`sections.tex:1`).

Reports in passages the tables do not list:

- `sections.tex:21` to `:33`, Vary paragraph length over the Discussion (six one-sentence paragraphs): the draft holds the break, against the clean row "the whole draft".
- `main.tex:25`, `:45`, `:49`, "usual care" against "usual mobilization": the draft holds the break (No synonym cycling).
- `sections.tex:17`, "Late mobilization" for the group called "the 170 others": the draft holds the break.
- `sections.tex:31`, "appears" on a reported result, under No hedge on facts: the draft holds the break; this is the binary-contrast clean row's passage.
- `main.tex:43`, First sentence states the point: the draft holds the break. The paragraph's last sentence was added at the landing of step 2.

The agent also ran `cat -n`, `grep -n -e ...`, `wc -w` and `grep -c` on the draft files, which its prompt does not allow ("run only `LC_ALL=C grep -n '[^ -~]' <file>`"). All are reads, and no file was changed.

## medicine, .docx (`3-writing-medicine-docx.md`)

Missed break: What the reader looks for, Cohort Methods (paragraph 23).

Second rule not named: paragraph 26 ("a hassle") names Reader's path / Clarity test where the row asks for Medicine and Health / Register.

Reports in passages the tables do not list:

- Paragraphs 10, 20, 22, "usual care", and paragraph 39, "the approach": the draft holds the break.
- Paragraph 28, "comorbidity score" with no named score: the draft holds the break (Most specific term).
- Paragraph 37, First sentence states the point: the draft holds the break; this is the semicolon clean row's paragraph.

## sciences, .tex (`3-writing-sciences-tex.md`)

Found under another group:

- `sections.tex:15` ("We were delighted ...") stands under Reader's path / Clarity test, naming Sciences / Register.
- `main.tex:27` ("6 inches") stands under Reader's path / Clarity test, naming Sciences / Terminology.
- The Activity Method stands under Reader's path / So what per section, naming Sciences / What the reader looks for.

In each, the report follows the order rule correctly, since the passage also breaks a rule of `references/rules.md`. The rows are the fault: they name one rule for a passage that breaks two.

Reports in passages the tables do not list:

- `main.tex:25` to `:35` and `sections.tex:3` to `:9`, Vary paragraph length (runs of one-sentence paragraphs): the draft holds the break.
- `sections.tex:13`, "Beetles were therefore most active in early summer.", Restating closes: the draft holds the break.
- `main.tex:19`, Passive voice: the draft holds the break; the sentence was rewritten to the passive at the landing of step 2.
- `main.tex:8`, "species richness" before its definition: the draft holds the break.
- `sections.tex:21`, an unhedged generalization: the draft holds the break.
- `main.tex:49`, "Richness therefore kept rising ...", under Transitions: the draft holds the break; the sentence was written at the landing of step 2.
- `sections.tex:25`, age with no data: the draft holds the break.
- `sections.tex:7`, "published keys" not named: the draft holds the break.

## sciences, .docx (`3-writing-sciences-docx.md`)

Found under another group: paragraphs 33, 11 and 28, as in the `.tex` report.

Reports in passages the tables do not list: those of the `.tex` report, and also the title's "Diversity" against "richness" (paragraph 1), "beetle activity" not defined (paragraph 2), "forest specialists" not defined (paragraph 25) and "the widest hedgerows" with no width (paragraph 23). In each, the draft holds the break.

## social, .tex (`3-writing-social-tex.md`)

All four break passages are found at their places under their groups.

Second rule not named: `sections.tex:21` ("a mixed bag") names Paragraphs / Claim with evidence or citation where the row asks for Social Sciences / Register.

Reports in passages the tables do not list:

- `sections.tex:37`, Plain prose only, on the semicolon clean row's paragraph: a punchy closing sentence ("Together they point to a loss of voice."). The draft holds the break.
- Vary paragraph length at six runs: the draft holds the break.
- `sections.tex:15`, "questionnaire" against "survey", and `:33`, "Interviewees" against "participants": the draft holds the break.
- `sections.tex:19`, Restating closes: the draft holds the break.
- `main.tex:35`, "voice" before its definition: the draft holds the break.
- `sections.tex:45`, the two-year period with no evidence: the draft holds the break; this is the Voice clean row's passage.

## social, .docx (`3-writing-social-docx.md`)

Missed break: Reader's path / So what per section with Social Sciences / What the reader looks for, the Interview Method (paragraph 9).

Second rule not named: paragraph 32 names Common style errors / Vague phrase where the row asks for Social Sciences / Register.

Reports in passages the tables do not list: paragraphs 38 and 42 (synonyms), 31 (restating close), 15 ("voice"), 44 (two years) and 40 (an unhedged interpretation). In each, the draft holds the break.

## What the reading shows

- **Skill misses.** The misses fall on rules judged over a section or the whole draft: What the reader looks for (in five of the eight runs), Limitations and alternative interpretations, Tense per section, Reader's four questions, No mirror structure and First sentence states the point. The engineering `.docx` run also missed three whole-draft counts.
- **Second rules.** Seven passages in all eight runs lose the second rule their row names.
- **Case files.** Nearly every report in a passage the tables do not list is a break the draft holds by the rule's own words. The short drafts do not keep the clean rows their tables claim, and three rows name one rule for a passage that breaks two.
- **Landing fixes of step 2.** Five of the places these reports fall on are sentences written at the landing of step 2: engineering paragraphs 64 and 66, medicine `main.tex:43`, and sciences `main.tex:19` and `:49`.

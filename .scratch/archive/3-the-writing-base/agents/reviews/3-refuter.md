# Step 3 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-3, base 8ff6ed7)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

`<cases>` below is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases`. A `.docx` place is the number `docx_paragraphs.py` prints for the new draft.

## Verification (rerun by the reviewer)

```
$ git status --short
 M skills/writing/SKILL.md
?? .scratch/3-the-writing-base/agents/reviews/3-report.md

$ git diff 8ff6ed7 --stat
 skills/writing/SKILL.md | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

# Brief check 1, the character-set check over the changed files (the brief's command, verbatim)
exit 0

# Brief check 2, per draft: python3 skills/writing/templates/docx_paragraphs.py <cases>/<draft>/draft.docx; echo "exit $?"
engineering: exit 0, 148 paragraphs, 2611 words (sed 's/^[0-9]*: //' | wc -w), 6 semicolons (grep -o ';' | wc -l)
medicine:    exit 0, 39 paragraphs, 754 words, 1 semicolon
sciences:    exit 0, 38 paragraphs, 723 words, 1 semicolon
social:      exit 0, 42 paragraphs, 739 words, 1 semicolon
(the numbered paragraphs printed equal the texts the builder's report quotes in its Check 2, read side by side)

# Brief check 3, docx output | LC_ALL=C grep -n '[^ -~]', and LC_ALL=C grep -n '[^ -~]' <cases>/<draft>/*.tex
engineering docx:
107:107: The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. The gain appears on every host.
108:108: The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
120:120: The report prints the status <left double quotation mark>complete<right double quotation mark> after each run.
121:121: The harness counts rejected tasks<horizontal ellipsis> and reports the total.
124:124: Completion order is queue <rightwards arrow> worker.
engineering tex: the same five lines at sections.tex:177, :179, :203, :205, :211
medicine, sciences, social: nothing printed (grep exit 1), both forms

# Brief check 4: git diff 8ff6ed7 -- skills/writing/SKILL.md
the 15 added lines after "Apply the rules that `references/rules.md` marks ..." and the one changed bullet, exactly as the builder's report quotes them (its Check 4); nothing else

# Places (C7): every expected.md row with one .tex place and one .docx paragraph, the passage's first sentence grep -q -F'd in that line and in that docx paragraph: no miss printed; the multi-place rows read with sed -n: each passage stands at its lines and paragraphs.

# Row counts, break / clean, base then new (sed -n "/^## <d>$/,/^## [a-z]*$/p" | grep -c '| break |' and '| clean |')
engineering 70 56 -> 66 56; medicine 6 11 -> 4 11; sciences 4 12 -> 4 12; social 7 12 -> 4 12

# Commands the builder's report quotes, rerun
git show 8ff6ed7:skills/writing/SKILL.md | grep -n -i -E 'every section|each section|first sentence|whole draft|per 1000|per page'   -> lines 10, 79, 127, as quoted
git show 8ff6ed7:skills/writing/SKILL.md | grep -n -i -E 'other rule|two rules'   -> line 100, as quoted
sed -n 74,120p skills/writing/SKILL.md | grep -n -E 'Em dash|Semicolon|Vary paragraph|Binary contrast|Plain prose|rule of three|Mirror|No mirror|repeated construction|Sentence length|Cold opens'   -> nothing, status 1
diff -r .scratch/3-the-writing-base/cases /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases   -> nothing, exit 0
the C4 grep over the base cases   -> the nine lines quoted (engineering main.tex:31, sections.tex:55, :91, :95, :119, :149; sciences main.tex:49, :51; medicine sections.tex:7)
docx_paragraphs.py on the base drafts   -> 148/2574/6, 41/697/1, 43/672/1, 46/737/1, as quoted
the vocabulary grep over the short drafts   -> one hit, sciences/main.tex:21 ("landscape"), as quoted
sentences of 22 words or more in the short drafts   -> medicine 22 and 22, sciences 23, social 25 and 24, as quoted
the C10 comparison of draft.html <p> lines with the .tex lines   -> engineering html only 7, tex only 14; medicine, sciences, social html only 1 (keywords), tex only 0, as quoted
grep -c -E '<ul|&nbsp;|<table' <cases>/*/draft.html   -> 0 for all four
ls -lT: each draft.docx is newer than its draft.html (engineering 19:18:22 after 19:18:12; medicine 19:41:10 after 19:41:03; sciences 19:42:00 after 19:41:59; social 19:41:12 after 19:41:03)
bullet lines of "Review agent prompt", base and new   -> 26 and 41, as quoted
glossary bold terms grep'd in the added lines   -> "term in diff: finding" only, as quoted
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1, the review agent prompt: violated, Spec 1. The bullets for section, first-sentence and whole-draft rules, the count bullet, the kept-rule bullet, the every-other-rule check and the any-number-of-rules bullet are all there, and no other bullet changed (the diff above). But the new bullet "Apply a rule that judges a section only to a section of the type its words name" takes "Reader's four questions" off every section, and that rule is one of the four the bullet above it lists.
- 2, the case files: violated, Spec 2 to Spec 7. Places, counts, line 4, the merged rows, the "How the tables read" bullet and the two forms all hold. But the rewrites leave clean passages and unlisted sentences that break rules by the rules' own words, several of them made by this round's own edits.

Cases of the brief's "Cases":

- C1: partial. The three check bullets are in the prompt (`skills/writing/SKILL.md:92` to `:103`), but Spec 1 removes "Reader's four questions" from every section.
- C2: met. `SKILL.md:106` has the agent check each reported passage against every other rule, and `:115` makes it stand once and name each other rule on its own line.
- C3: partial. The diff shows only the new bullets and the changed bullet, no prose-standard label is named (the grep above prints nothing), and `version: "1.0.0"` is unchanged. The changed bullet breaks `docs/dev/skill-layout.md`'s one-rule-per-bullet rule (Standards 1).
- C4: partial. Every passage the gate reading lists now keeps the rule the reading named. Two exceptions: the landing sentence at sciences `main.tex:49` (now `main.tex:39`, paragraph 17) breaks "Common style errors / Tense per section" (Spec 4), and the rewritten correctness-proof paragraph (engineering `main.tex:31`) still reads as a break (Spec 6).
- C5: met. Every rule of a base break row is named by the new break row of the same passage: the five dash rows name "B. Punctuation / Em dash and dash-as-aside", the arrow rows name "B. Punctuation / ASCII throughout", and the register rows are folded into the rows of their passages. The groups follow the prompt's order.
- C6: met. The "modern server" row names Vague phrase, Register and Terminology. The three sciences rows stand under the `references/rules.md` rule with the register rule named. `:223`, `:13`, paragraph 70 and paragraph 98 name their second rules. The arrow row at `:209` keeps "ASCII throughout", which is right by that bullet's own words ("`->` only in code").
- C7: met. No place miss in the run above.
- C8: met. The counts above equal the row texts: 2611, 754, 723 and 739 words; 6/2611 is 2.30 per 1000 with a limit of 5, and 1.33, 1.38 and 1.35 for the short drafts. The paragraph counts and the word ranges of the Vary paragraph length rows (10 to 51, 7 to 40, 7 to 35) also hold. One stated count fails under the file's own definition of a paragraph (Proof 1).
- C9: unmet: Spec 2, Spec 3, Spec 4, Spec 5, Spec 6, Spec 7.
- C10: met. The `.html` and `.tex` differ only in the keywords line, the entity spellings and the eight "not in the `.docx`" lines. Each `.docx` is newer than its `.html` and prints the edited text.

## 1. Spec

- Spec 1. `skills/writing/SKILL.md:97`: "- Apply a rule that judges a section only to a section of the type its words name." together with `:95` "  - The reader's four questions."
  - What is wrong: bullet 92 lists "Reader's four questions" as a rule to check against every section. Bullet 97 then limits each section rule to sections "of the type its words name". The words of "Reader's path / Reader's four questions" in `references/rules.md` ("At any point the reader can answer four questions") name no type of section, so a literal reading of bullet 97 applies that rule to no section, and the two bullets contradict each other. The brief's item 1 asked for the restriction so that a section the rule does not name gets no finding. It did not ask that a rule naming no section type be dropped. The brief's own wording has the same gap.
  - Failure scenario: on the engineering draft the agent reads bullet 97 literally and does not apply the four questions to "Implementation" (a type no rule's words name). It misses the break row at `sections.tex:1` / paragraph 19, one of the misses this round exists to close. A wording that limits only the rules whose words name a type of section ("A rule whose words name a type of section applies only to sections of that type") would close it.
  - Verdict: item 1 violated, C1 partial.
- Spec 2. `<cases>/sciences/sections.tex:11` (paragraph 27): "Beetle activity peaked in June, with 41 percent of all captures. Activity fell below 5 percent per month after August." Also `<cases>/social/sections.tex:17` (paragraph 28): "Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale."
  - What is wrong: the builder fixed the restating close in each paragraph by deleting the last sentence ("Beetles were therefore most active in early summer." and "Losing an office was therefore associated with lower trust.") without putting an interpretation in its place. Each paragraph is now evidence with nothing after it that says what it means, the same shape as engineering's break row for "Paragraphs / Evidence followed by what it means" (paragraph 68, "The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent."). Neither row lists these passages, and each short draft says it holds "no other break". The builder's report, under its judgment calls, fixed exactly this fault in sciences paragraph 17 and left it in these two paragraphs.
  - Unlisted and unchanged from the base: engineering `sections.tex:93` (paragraph 65), "... It held on all four hosts.", likewise ends on evidence with no interpretation.
  - Failure scenario: the second run reports these passages under "Paragraphs / Evidence followed by what it means". The reading counts them as reports in unlisted passages, the case files' fault, and step 3 fails its check again with no round left.
  - Verdict: item 2 violated, C9 unmet.
- Spec 3. Recurring sentence shapes in drafts whose clean row "0. Hard rules / No repeated construction" reads "No sentence shape recurs across sections.":
  - Medicine. `<cases>/medicine/main.tex:35` (paragraph 15), "Readmission was recorded from hospital records for 30 days after discharge.", and `<cases>/medicine/sections.tex:9` (paragraph 26), "Readmission was again recorded from hospital records for 30 days after discharge." The builder added the second sentence, so the same sentence now stands in Trial Methods and in Cohort Methods. Step 2's brief, item 3, which still holds, names this very case: "two near-identical passages break ... section 0's 'No repeated construction'".
  - Social. Five paragraphs across Interview Results and Survey Results now end on the shape "<subject> may have <past participle> ...": `main.tex:37` "That proximity may have explained the view.", `:39` "so distance may have cut ...", `:41` "A nearby office may therefore have preserved that contact.", `sections.tex:21` "Years of residence may have mattered more to trust than age." and `:23` "Distance may have helped to explain ...". Four of the five were made by this round's tense edits; the base had only `:41` in this shape (`grep -o -E '... may (therefore )?have [a-z]+'` on base and new).
  - Engineering, unlisted. `sections.tex:31` "Both thread counts stayed below the core count of the smallest host." and `:255` (paragraph 145) "The thread count of 64 stays below the 96 cores of the smallest host." The synonym edit ("pool size" to "thread count") made these two near-identical across Implementation and Discussion.
  - Failure scenario: the second run reports "No repeated construction" in medicine or social, against a clean row, or at an unlisted engineering place, and the check fails as in Spec 2.
  - Verdict: item 2 violated, C9 unmet.
- Spec 4. `<cases>/sciences/main.tex:39` (paragraph 17, Richness Results): "Plots wider than 5 m held 16 species on average, 3.7 species above the mean of all plots. That excess agrees with the positive association between width and species richness."
  - What is wrong: "agrees" is present tense in a Results section. The builder's judgment call moved every present-tense clause of the short drafts' Results sections into the past, because "the rule's words give the tense of the section" ("Common style errors / Tense per section": Results, Past). This new sentence breaks that same reading. The sentence is one of the five landing sentences the brief asks to keep every rule, and its first sentence is the Register clean row's passage.
  - Failure scenario: the second run reports Tense per section at Richness Results or at paragraph 17, a report in an unlisted place in a draft that should hold no other break.
  - Verdict: item 2 violated, C4 partial, C9 unmet.
- Spec 5. Paragraphs merged to vary paragraph length that now hold two ideas, against "D. Structure / Paragraphs cover one idea" and "Paragraphs / First sentence states the point", and against step 2's brief, item 3 ("Every paragraph keeps one idea ... and opens with its point"):
  - `<cases>/sciences/main.tex:31` (paragraph 13): "Hedgerow width was measured at 5 points per plot. The mean of the 5 values was used. Hedgerow age was taken from the farm records." The width measurement and the source of the age data are two ideas, and the first sentence states only the first.
  - `<cases>/sciences/main.tex:29` (paragraph 12, the Voice clean row's paragraph): the spacing of the plots for independence, then "A limitation of the richness survey was that all plots lay in one region."
  - `<cases>/social/main.tex:17` (paragraph 6): "Merged municipalities now serve 18 percent of residents in the country (Statistics Office, 2022). The study followed residents of two towns that merged in 2019." This is a national statistic and the study's sample, with nothing that connects them. The statistic is also evidence with no sentence saying what it means for a claim.
  - Failure scenario: the second run reports these paragraphs under "Paragraphs cover one idea" or "First sentence states the point". These are reports in unlisted passages.
  - Verdict: item 2 violated, C9 unmet.
- Spec 6. `<cases>/engineering/main.tex:31` (paragraph 13): "The correctness proof of this design fits into two pages (Jones, 2020), so the objection to this design concerns its cost."
  - What is wrong: this is the gate reading's Clarity-test passage, fixed by adding a "so" clause. A short correctness proof does not make cost "the objection": the clause asserts a cause that the two clauses do not have. "the objection" also refers to an objection the draft never states. By the words of "Objectivity / Claims rest on evidence" (a claim rests on evidence, not on opinion), and since no later paragraph uses the proof, the paragraph still reads as a break of "Reader's path / Clarity test". The first run's agent reported the same kind of non sequitur at paragraph 64.
  - Failure scenario: the second run again reports paragraph 13 under Clarity test, or now under Claims rest on evidence, in a passage no row lists.
  - Verdict: item 2 violated, C4 partial, C9 unmet.
- Spec 7. `<cases>/engineering/main.tex:8` (paragraph 2): "It lowered the 99th percentile latency, the tail latency that 99 percent of tasks stayed below, from 410 to 190 microseconds."
  - What is wrong: the builder's new apposition declares "99th percentile latency" and "tail latency" to be one thing. The draft then uses both names, and also "the tail", for it: `sections.tex:35` (paragraph 36, "tail latency"), `:131` (paragraph 84, the passages of the Rhetorical questions and Hedge clean rows, "the tail latency", "tail latency") and `:135`, `:139`, `:125` ("the tail"). By "D. Structure / No synonym cycling" ("One term per concept, repeated") these are breaks in clean rows' passages and unlisted sentences. The usage was there in the base, but the base never said the two names meant one thing. This is the least certain of these findings: a reader can take "tail latency" as the general concept and "99th percentile latency" as its measure.
  - Failure scenario: the second run reports No synonym cycling at paragraph 36 or paragraph 84, a report in a clean row's passage.
  - Verdict: item 2 violated, C9 unmet.

## 2. Proof

- Proof 1. `<cases>/expected.md:87` (the engineering "Vary paragraph length" row): "the longest other run of consecutive paragraphs with one sentence count is 4 (1 sentence each, 6 to 19 words: paragraphs 23 to 26, 35 to 38 and 55 to 58)".
  - What is wrong: the builder added this count. `expected.md:17` says "A list in a `.docx` prints one paragraph for its introduction and one for each item". Under that definition, paragraphs 132 to 137 ("The fixed pool leads on ALL four hosts.", "The harness writes four result files." and the four items) are six consecutive one-sentence paragraphs of 6 to 9 words, and 139 to 143 are five. Counted that way, the longest other run is 6, not 4. The count holds only if list items are not counted, and the row does not say so.
  - The decision that rests on it: the reading of the second run's engineering report, which decides whether a "Vary paragraph length" report at paragraphs 132 to 137 is a false alarm or a break the row says does not exist.
  - Failure scenario: the reader of the second run counts the list items as `expected.md:17` defines them and finds this row false.
  - Verdict: none on its own (C8's other counts hold).
- Proof 2. The builder's report, "C9, the clean text, per draft", says each draft was read "every sentence in turn" against every rule, and its DONE / NOT DONE table marks item 2's clean-text rows DONE. My reading does not bear that out: Spec 2 to Spec 7 are sentences in clean rows or in no row, which break a rule by the rule's own words, most of them made by this round's own edits. The decision that rests on it is the landing, then the second run with no further round. Verdict: C9 unmet.

## 3. Standards

- Standards 1. `skills/writing/SKILL.md:115`: "- A passage that breaks more than one rule stands once, in the first group in that order. Its finding names each of the other rules it breaks, each on a line of its own."
  - What is wrong: `docs/dev/skill-layout.md`, "Lists and tables", says "two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets". Placing the passage once in the first group and naming every other rule can each be broken while the other holds. The builder's report (Check 5) calls this "still one instruction". The base bullet joined the two requirements with "and", but this round rewrote it, so the rule applies to it now.
  - Failure scenario: a reviewer, or the agent, checks the bullet as one instruction and misses that only one half was followed.
  - Verdict: C3 partial.
- Standards 2. `<cases>` drafts, sentence length. These are noted with no verdict, because "roughly 20 words unless the mechanism needs more" leaves room. The builder's own edits made sciences `main.tex:45` 23 words (base 11) and medicine `sections.tex:15` 22 words (base 21).

## 4. Behaviour

- Behaviour 1. `skills/writing/SKILL.md:99` to `:103`: "- Check the whole draft once against each rule that judges the whole draft:" with "  - A count per 1000 words or per page." and the three items after it. Also `:92` to `:96`.
  - What is wrong: each colon-introduced list is the four kinds the brief's item 1 names from Ordo's own prose standard and `references/`. Read as a closed list, it tells the agent which whole-draft rules exist. Under ADR 0001 ("`/writing` ... read[s] the prose standard where it is: the page the repository's `standards` key lists, or `docs/dev/prose-standard.md`"), a repository's own prose standard may hold a whole-draft rule outside the four, and that rule would go unchecked. The builder's report states the change as a host-visible change but does not name this limit.
  - Failure scenario: in a repository whose prose standard adds, say, a per-page limit on passive sentences framed as a recurring count, the agent reads the list as complete and checks only the four. Low weight for Ordo's own gate.
  - Verdict: none.
- Behaviour 2. `skills/writing/SKILL.md:100` and `:104` ("A count per 1000 words or per page.", "Give a count you made only inside the finding of the break it shows.") read against `:83` and `:84` ("run only `LC_ALL=C grep -n '[^ -~]' <file>`", "run only `python3 <docx_paragraphs.py> <draft>` ...").
  - What is wrong: the prompt now asks for word-based counts explicitly but still allows no command that counts. Ruling D1 decided "the review reads", so this is not a contradiction. The gate reading records that the first run's medicine agent already ran `wc -w` and `grep -c` against the "run only" bullet.
  - Failure scenario: the second run's agent runs `wc -w` to make the count bullet 100 asks for, outside its prompt. Or it counts 2611 words by reading, gets it wrong, and gets the semicolon limit wrong.
  - Verdict: none.

## Declined to judge

- Whether the short drafts' sentences of 22 to 25 words break "Sentence length" ("under roughly 20 words unless the mechanism needs more"). The rule's own words leave the margin to judgment, so they are noted under Standards 2 only.
- Whether the arrow row at `sections.tex:209` should name "B. Punctuation / ASCII throughout". The bullet's words ("`->` only in code") support the row, and the brief left the reading to the builder, so I record it as met under C6 and do not rule further.
- The builder's counts of places checked ("113 tex places, 104 docx places", and so on): not recounted. My own run over the same rows found no miss, and no decision rests on those totals.
- No command in the builder's report runs a git command other than `git show` and `git status`, so nothing was declined for that reason.

Reviewer usage: a57bba76c73b503b3, claude-opus-5-5, 289143 tokens, 57 tool uses, 13 min 20 s.

## Closed (each finding's disposition; all fixed at landing on main, since this is the step's one repair round and no round follows)

- Spec 1: `skills/writing/SKILL.md`, the bullet now reads "Apply a rule whose words name a type of section only to sections of that type.", so "Reader's four questions" applies to every section.
- Spec 2: an interpretation sentence added to sciences `sections.tex:11` (paragraph 27, "A survey limited to late summer would therefore have missed most of the activity."), social `sections.tex:17` (paragraph 28, "Those who had lost an office thus fell just below the scale's neutral point, and the others above it.") and engineering `sections.tex:93` (paragraph 65, "Since every host gained at least 22 percent, the effect did not depend on a single host.").
- Spec 3: medicine `sections.tex:9` (paragraph 26) now reads "The primary outcome matched the trial outcome. Each patient's readmissions within 30 days of discharge came from hospital records."; social `main.tex:39` now ends "which suggests that distance cut their contact with the council.", `:41` "A nearby office thus appeared to preserve that contact.", `sections.tex:21` "Years of residence thus related more closely to trust than age did." and `:23` "The survey result agreed with the participants' accounts of contact lost to distance.", leaving one "may have" close at `main.tex:37`; engineering `sections.tex:31` now ends "Neither count reached the core count of the smallest host."
- Spec 4: sciences `main.tex:39` "agrees" is now "agreed".
- Spec 5: sciences `main.tex:31` (paragraph 13) opens with its point, "Each plot's hedgerow was described by its width and its age.", followed by the two measures; sciences `main.tex:29` (paragraph 12) now ties the limitation to the spacing ("Because all plots lay in one region, the samples were independent within that region only, a limitation of the richness survey."), and the limitations row quotes it; social `main.tex:17` (paragraph 6) now reads the statistic and what it means ("A loss of trust after a merger would thus reach many of them."), and `main.tex:19` (paragraph 7) "Interviews and a survey followed residents of two towns that merged in 2019."
- Spec 6: engineering `main.tex:31` (paragraph 13) now reads "A correctness proof of this design exists (Jones, 2020), so this study measures only its performance."
- Spec 7: engineering `main.tex:8` no longer names the 99th percentile latency "the tail latency"; "tail latency" at `sections.tex:35` and the three uses at `:131` are now "99th percentile latency", and the rows at `expected.md` quoting them follow. "the tail" for the part of the distribution stays.
- Proof 1: the engineering "Vary paragraph length" row now says the list items of paragraphs 134 to 137 and 140 to 143 are not counted as paragraphs.
- Standards 1: the two-rule bullet is now two bullets.
- Standards 2: no change; noted with no verdict.
- Behaviour 1: the two list introductions now end "such as these:", so the lists read as examples.
- Behaviour 2: no change. The prompt's command limits stand under ruling D1 (the review reads); the count bullet asks for no count, only where a count goes.
- With these fixes: each `draft.docx` made again with `textutil`; the word counts 2619, 754, 747 and 763 and the semicolon rates, the sentence-count lists of the sciences and social "Vary paragraph length" rows and the social word range (7 to 48) updated in `expected.md`; every single-place row compared with its `.tex` line and `.docx` paragraph (142 held, 0 missed); `checks.sh` on main: `checks: 6 commands passed`.

# Step 9 brief check (on main at 5356252)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/9.md`. Pages are cited by section. Lines of the brief and of the tree are cited as `file:line`, as on main at 5356252.

Coverage, in short. All 48 manuscript rows and all 35 grant rows of `8-marks.md` "Rows not marked right by both" are named in at least one fix. So are the eight group lines of gate condition 2 and the three failures of gate condition 5. Read against its cause, the named fix does not reach these rows:
- grant 11c, 11d, 11e and the 30-word sentence of 7b (sentence-length threshold, findings 1 and 2 under 5);
- grant 1c (condition dropped in a sentence split, finding 4);
- manuscript 3.3, 3.7 and Methodology 57, grant 1b and 17a, and marker 2's reasons for grant 4a and 14b (operation 10 repeats the old check, finding 3);
- manuscript 13.12 (operation 9 repeats the old count, finding 3);
- the ECE-only limits of manuscript 1.1, 1.9, 1.10 and 13.20 (operation 7 repeats the old check, finding 3);
- the group 9 heading (finding 5).

Fix 6's wording also puts 3.3 at risk (finding 7). The two operations that check places as dictated would hit correct findings (finding 6). The handling of gate condition 6 is right, except that the corrected step line leaves out one of its failures (section 2).

## 1. Names

- The step renames no file, heading or key. "The last pass", "How you group them", "Terms defined at first use" and "Vague language" all keep their names. The sense of "vague qualifier" is widened.
  - `grep -rn '--include=*.md' -e '"The last pass"' -e '"How you group them"' -e 'Terms defined at first use' -e '"Vague language"' -e 'robust estimator' -e 'vague qualifier' . | grep -v "^./.scratch\|^./skills/writing/"`: every hit is under `.scratch/archive/` (refuter records such as `.scratch/archive/2-e-a-self-rule/agents/reviews/4-refuter.md:340`). These are records, and the change makes none of them false.
  - `grep -rn -e 'skills/writing' -e '`writing`, "' skills docs utils README.md .agents | grep -v "^skills/writing/"`: the hits are `docs/glossary.md:46` and `skills/repo-setup/templates/plan-terms.md:41` (**finding**), `:117`/`docs/glossary.md:122` (**standards**), `docs/academic-coverage.md:76,100,101`, `docs/adr/0001-...:11,15,16`, `docs/dev/scripts.md:23` and `docs/roadmap.md:25,200`. None names a sentence, a line or a section the step changes, so the change makes none false. The **finding** entry ("a passage ... reported as a break of a named rule, with its place, the quoted passage and a proposed replacement") stays true.

Findings: none.

## 2. The step line

- "run only when step 8 leaves a row not marked right by both or a gate condition failing": brief lines 14 to 16 and `8-report.md` line 1 (48 and 35 rows; conditions 2, 5 and 6 fail).
- "each such row and failure fixed in `skills/writing/SKILL.md` or `skills/writing/references/`": "What to build", fixes 1 to 9 and "Paths this step writes".
- "with no further run": no requirement runs `/writing`, which meets it.
- "the failures of gate condition 6 concern the markers' prompts and commands, no text of `/writing`, and the closing report names them": brief line 15. This handling is right when read against `8-report.md` condition 6, whose five points are:
  - manuscript marker 1's third command, which printed draft lines;
  - manuscript marker 1's first command and grant marker 1's third, each a `grep` on the saved report;
  - the grant marker prompts, which lacked the `grep` rule;
  - 17 marks with no reason of their own.

  Each concerns the markers or the prompts the session wrote under step 8's brief. None concerns a sentence of `skills/writing/`, so no fix of `/writing` can close them, and with no further run nothing in step 9 can.
- "after the landing, main's head tagged `v7.1.0-rc.5` and pinned": brief line 58.
- The check ("the refuter reads each fix ... and the skill against `docs/dev/skill-layout.md`, and `sh skills/land/templates/checks.sh ...` passes"): this is the refuter's and the landing's work. Brief "Verify before you report" 4 and 5 serve the reading.

Findings:
- The step line as corrected (`git diff -- .scratch/3-the-writing-base/plan.md`, step 9's line) says the condition 6 failures "concern the markers' prompts and commands". `8-report.md` condition 6 and brief line 15 also count "17 marks without a reason of their own" (manuscript marker 1's 12.1 to 12.9 and 14.2 to 14.5, manuscript marker 2's 14.2 to 14.4, grant marker 1's 16s). The step line, which the closing report follows, leaves these out. It should name the marks too, for example "the markers' prompts, commands and reasons".

## 3. Premises

- Line 11:
  - `wc -l skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md` printed `238`, `223`, `53`.
  - `grep -n version skills/writing/SKILL.md` printed `5:  version: "1.0.0"`, plus lines 82 and 218 (Claude Code version text).
  - `ls skills/writing/templates` printed `docx_paragraphs.py`.
  - `git diff --quiet a34bfbf HEAD -- skills/writing; echo $?` printed `0`.
  - `diff -r skills/writing ~/.claude-backup/skills/writing` printed nothing, exit 0.
  - `git -C ~/.local/share/ordo-stable describe --tags` printed `v7.1.0-rc.4`.
  - All of this matches the brief.
- Line 12: `git diff --quiet a34bfbf HEAD -- docs/dev/building.md docs/dev/change-standard.md docs/adr; echo $?` printed `0`. Matches.
- Line 13:
  - `grep -n "A plan that changes a skill raises one part" docs/dev/skill-layout.md` printed line 23 with the quoted words.
  - `git show b9f9831:skills/writing/SKILL.md | sed -n 5p` printed `  version: "1.0.0"`. b9f9831 is "Land step 1 of plan 3".
  - Matches.
- Line 14:
  - `grep -n "^#" 8-marks.md` printed `323:## Rows not marked right by both`, `325:### The manuscript run (48 rows)`, `472:### The grant run (35 rows)` and `580:### Group lines either marker names ...`.
  - `ls 8-run/` lists the two reports and the marks and resume files.
  - Matches.
- Line 15:
  - The condition 6 failures match `8-report.md` condition 6.
  - "This `/spec` corrected step 9's line in `plan.md` to say so" holds only in part, as section 2 says.
- Line 16:
  - The quotes of `SKILL.md:131`, `:152` and `:169-173` match `cat -n skills/writing/SKILL.md`.
  - "27 manuscript and 22 grant rows": the bullet's manuscript rows, read from `8-report.md` "The rows not marked right by both", first bullet, are 27 distinct rows. That matches.
  - The grant rows are 19 length rows (2f, 2h, 4a, 7a, 7b, 8c, 8g, 8i, 8j, 11c, 11d, 11e, 12a, 13a, 16a, 16b, 16j, 16t and 16u, read from the reasons in `8-marks.md` lines 472 to 578), plus 5 two-claim rows (11f, 14b, 16o, 16v, 16z), plus 2 "scan" rows not already counted (7d, 16n). That is 26, which is also the length of fix 1's own grant list.
- Line 17: `SKILL.md:143` matches. The prose standard's section A list holds those words plus "near-zero, sub-second, most requests". Matches as a subset.
- Line 18: `SKILL.md:144-151` matches. 5.5 and 5.11 match `8-marks.md`.
- Line 19: `rules.md:8-9` hold the quoted sentences (the brief says lines 8 to 10, and line 10 is the next rule). 5.1 and 6.1 match.
  - `grep -n "title\|abstract\|input" main.tex` on the copy printed `45:\title{HCCNet: A Self-Supervised CNN-Transformer ...}` and `96:\begin{abstract}`, `97:\input{sections/abstract/abstract}`. Matches.
- Line 20: `rules.md:161-171` ("Vague language" from its heading to the last row). Matches.
- Line 21: `rules.md:208` matches.
- Line 22: `SKILL.md:184-208` matches.
- Line 23: `SKILL.md:177-183` matches. The eight group lines match `8-report.md` condition 2 and `8-marks.md:580` onward.
- Lines 24 to 29:
  - `docs/glossary.md:58` (**kind**) and `:46` (**finding**) match.
  - The quotes of ADRs 0001 to 0003 match their Decision sections.
  - The Decisions of ADRs 0004 to 0012 (each read) govern self-rule, choices, agent ids, the repair reviewer, the cost script, the verify list, the dispatch block and commits on main. None governs `skills/writing/`. Matches.

Findings:
- Line 16 says the largest kind holds "22 grant rows". The bullet of `8-report.md` names 26 grant rows: 19 length rows, 5 two-claim rows and 7d and 16n. That is fix 1's grant list. No decision rests on the count, but the premise is wrong as written.
- Line 15's "to say so" does not hold for the 17 marks without a reason (section 2).

## 4. Cases and checks

- C1 to C9: each names its fix's rows and an "Expected after" sentence. They are text cases, checked by reading, as `docs/dev/change-standard.md`, "Scripts compute facts; judgment is read" and rule 1 say. They are consistent.
- C3 carries a control (grant 2a, right by both, stays allowed). C6 carries two (3.3 and "some patients", not covered). C10 is a regression set. `grep -n` over `8-marks.md` shows that 1.3, 4.1, 5.3, 7.2, 8.1, 12.1 to 12.9, 2a, 5a, 6a, 9a and 15a are all `right | right`.
- No case asks the builder to check, quote or explain a place the step does not change. The draft copies and the `8-run` records are read as inputs, and the "Expected after" of each case is a sentence of `skills/writing/`.

Findings: none.

## 5. The question

The goal is the part of the plan's Goal and Gate this step delivers: each row not marked right by both, and each failing gate condition, fixed in the rules or the skill.

- C1, fix 1: yes for grant 11c, 11d, 11e and 7b's written sentence. These findings already name the sentence-length rule, and `SKILL.md:152` already says "it leaves each sentence it writes within that rule", yet they wrote sentences of 28 to 30 words (`8-marks.md`). Rewriting line 152 "whatever rule the finding names" changes nothing for them. The cause is how the agent reads the prose standard's "under roughly 20 words unless the mechanism needs more". `8-run/grant-marks-2.md:5` notes the report itself counts a 28-word sentence as a break (group 9, paragraph 46), while 11c and 11e write 28-word sentences. No fix reaches that cause. The C1 check passes by naming rewritten line 152.
- C1, fix 1: yes, since `SKILL.md:128,129,133,134,136` say "the named rule", in the singular. Fix 1 has the replacement end every break the passage holds, and the brief does not name these lines. After the change, `:133` ("It changes no claim's scope or strength beyond the change the named rule asks of it") and `:134` still forbid the change that ends a break named only on an also-breaks line. One example is the cut of "slightly" in Methodology 67 under a Tense finding. That leaves two statements that contradict each other (`docs/dev/change-standard.md`, rule 19), and the agent can keep the extra break while following `:133`.
- C2, fix 2: no. The size and degree words of the rows are listed or are of the named kind.
- C3, fix 3: no. It has the 2a control.
- C4, fix 4: no.
- C5, fix 5: no for 5.1 and 6.1, since the title is named. The dictated wording raises a separate defect (section 8).
- C6, fix 6: yes. The dictated rule "a row covers its phrase with its noun replaced by another noun that names published work or its authors" applies to every row. With the row "in recent years", replacing "years" by "studies" gives "in recent studies". That reads onto 3.3's passage "enticing recent studies" (`8-run/manuscript-report.md:86`), against C6's expected "3.3 not covered" and Decision 2's last bullet.
- C7, fix 7: no for 11.4 and 13.13. The exemption ends the finding (wording in section 8).
- C8, fix 8: yes, in four ways.
  1. **Operation 10 repeats an old check.** "check that the named rule's own words describe the break, and that a word section A keeps is not reported" repeats `SKILL.md:106-107` and `:197-198`, which the agent already had and broke. The rows that rest on it are manuscript 3.3, 3.7 (evidence at `introduction.tex:5`, already counted by `rules.md:67`) and Methodology 57 ("just" as a minimality claim), grant 1b and 17a, and marker 2's reasons for 4a and 14b. The brief's own premise (line 22) is that the old list "says what to check and not how". These operations still say what, not how. Examples of a how:
     - for "Evidence for claims", find in the draft read every other place that states the claim, with its citation;
     - quote the words of the named rule or table row that describe the passage, and read each exception of that section against it.
  2. **Operations 9 and 7 repeat old checks.** Operation 9's count "with the sentences other findings add" repeats `:160` and `:205`, which reaches 13.12 no further. Operation 7 repeats `:138` and `:201`, which leaves the ECE-only limits of 1.1, 1.9, 1.10 and 13.20 where they were. Neither says how to find the findings in the paragraph, or every measure of the claimed property.
  3. **Row 1c is reached by no operation.** The Formality split drops "If the hypothesis holds" from its second sentence (`8-run/grant-report.md:21`). Operation 5's word-by-word comparison finds the condition kept once. Operation 9 names no condition. `SKILL.md:161` states the condition rule only among the paragraph-split forms, so a sentence split is outside it.
  4. **Operations 1 and 11 check the place, not the passage at its place.** These are "check that no other finding or list entry gives that place" and "list every place the report gives, and check that none stands twice". In a correct report many findings share a place:
     - grant paragraph 42 holds 2h, 8g, the group 11 finding, 12a, 13a, 16u, 16v and 16y;
     - `a_data.tex:3` holds several manuscript findings;
     - `8-report.md` condition 5 reads the split quotes of other findings' sentences as allowed.

     Read as dictated, these operations make the agent drop or merge correct findings, or skip the check. What condition 5 failed on is the same quoted words, or overlapping words, at one place outside the split form.
- C8, group 9 heading (related-work entries under "Methodology"): yes. No operation reads the section label of a list of places. Operation 10 reaches it only if the agent takes the label as the named row.
- C9, fix 9: no for the eight lines. However, no case reads a group line both markers accepted (such as manuscript group 1, or grant group 2) against the new form. C10 holds findings only, so a line made worse by the new form would pass.
- C10: no.
- The step line's check: yes. With no further run, whether the changed text keeps the agent from each row is judged only by reading. This is ruling I's design ("step 9 fixes each in `skills/writing/` with no further run"), so the brief cannot close it.
- Verify 1 to 3: facts (character set, glossary sync, spaced dash), which pass without the goal. Verify 4 and 5 are readings.

Findings:
1. Grant 11c, 11d, 11e and 7b: the cause, an uneven reading of the sentence-length threshold, is unreached. One rule that closes it without copying the prose standard (ADR 0001): "a sentence the report names as over the length rule in one finding sets the length no replacement of the report writes". Stating a fixed number instead is a reading of the user's standard, a choice the user may want to see.
2. Fix 1 leaves `SKILL.md:128,129,133,134,136` saying "the named rule". The brief should have these read as "a rule the finding names".
3. Operations 7, 9 and 10 repeat checks the agent already broke: manuscript 3.3, 3.7, Methodology 57, 13.12, 1.1, 1.9, 1.10 and 13.20; grant 1b, 17a, 4a and 14b.
4. Row 1c: no operation and no rule keeps a governing condition in each sentence of a sentence split.
5. The group 9 heading: no operation reaches it.
6. Operations 1 and 11 test the place, so they hit correct findings.
7. Fix 6's wording covers "recent studies" under "in recent years".
8. C9 has no group line that passed as a control.

## 6. Implied inputs

- Not a code step: the step changes three Markdown pages of a skill and writes a report. No script and no product code change.

Findings: none.

## 7. ADRs

- 0001 (in force, proposed) touches the step: "`skills/writing/` holds no copy of it." The brief names it (line 26). No fix copies a rule of the prose standard. Fix 1's example kinds and fix 2's example words name kinds, not rules.
- 0002 (proposed) touches the step: "No rule that contradicts the prose standard is carried." The brief names it (line 27). Fix 7's exemption agrees with the prose standard's section A ("standard domain terminology is exempt"). Fix 6 widens a row over "many", which section A already makes a vague qualifier.
- 0003 (proposed) touches the step: "`/writing` starts one fresh agent that changes nothing ... reports only breaks of a named rule." The brief names it (line 28). Fix 8 keeps the last pass inside the same agent.
- 0004 to 0012: each Decision read. None governs a file, name or behaviour of `skills/writing/`, as brief line 29 says.

Findings: none.

## 8. Dictated text

- `grep -n -F 'general kinds the rule names' briefs/9.md` -> line 37: "The examples of what the replacement must not keep are general kinds the rule names: a vague qualifier, a sentence over the length rule, a change of tense or voice, two ideas in one sentence, a list in paragraph form, a relation with no limit, a performative aside." It breaks three rules:
  - It is 48 words with seven list-shaped items in paragraph form, against prose standard section D ("Three or more list-shaped items in paragraph form become a list") and section E ("Sentence length").
  - "a change of tense" misstates the break. A tense change the "Tense per section" row asks for is no break. What 7.1 and 13.11 got wrong is a tense change the finding does not name, and "keep" does not fit a change the replacement makes.
- `grep -n -F '"markedly", "largely", "essentially"'` -> line 38 (the example words): holds.
- `grep -n -F 'replaced by the share or the count'` -> line 39: three sentences, each within section E. The sentence "A bracket that holds "or" is allowed only where each alternative, supplied alone, keeps the claim's scope." restates `SKILL.md:146` and does not say it replaces it. The brief's "What to build" asks that "the fix replaces that sentence rather than adding a second one beside it", and `docs/dev/skill-layout.md`, "Where a rule goes", says "A rule is written once". `SKILL.md:145` ("names the number, the share of cases ... or the specific claim") is the sentence that allowed the size bracket of 5.5 and 5.11, and the item should name it as the sentence changed.
- `grep -n -F 'uses a name that covers the same set'` -> line 40: holds in itself. "never a narrower ... one" can be read against `rules.md`, "Most specific term", whose replacement is the more specific term for the same thing. Keeping line 142's "as "Most specific term" does" closes that reading.
- `grep -n -F 'from its title in the main file'` -> line 41: "a `.tex` draft is read as one document from its title in the main file, then its abstract and its sections in the order the document prints them; a `.docx` draft from paragraph 1." It breaks three rules:
  - "in the order the document prints them" puts a second reading order beside `SKILL.md`, "What you read" ("The text of a file stands where the command that names it stands"), which is source order. Print order differs from source order for floats, for `\maketitle` and for front matter. This is against `docs/dev/skill-layout.md`, "Where a rule goes", and `docs/dev/change-standard.md`, rule 19.
  - "its abstract and its sections" leaves out captions, tables, the appendix and footnotes.
  - It is 34 words (section E).

  A wording within the rules: read from the main file's first line, its title included, in the order "What you read" gives.
- `grep -n -F 'with its noun replaced by another noun'` -> line 42: it covers the row "in recent years" too (section 5, finding 7), and is 32 words (section E). Naming the rows, "many studies" and "some researchers", or "a row whose noun names published work or its authors", closes both.
- `grep -n -F 'whose result holds under changes to the data'` -> line 43: ""robust" in statistics, for an estimate or a method whose result holds under changes to the data or its partition, as in "robust estimator" or "robust performance estimates"."
  - The example "robust performance estimates" is the draft's own phrase (`a_data.tex:3`, "To obtain robust performance estimates"), against the brief's "What it must do" ("The examples a rule gives are general").
  - "or its partition" fits the draft's cross-validation.
  - "whose result holds under changes to the data" describes no estimator, since every estimate changes with its data. The statistical sense is an estimate insensitive to outliers or to departures from the model's assumptions.
- `grep -n -F 'find the quoted passage at its place'` -> line 45, the first operation: it joins two requirements with "and" (`docs/dev/skill-layout.md`, "Lists and tables", one rule per bullet), and "gives that place" tests the place, not the passage (section 5, finding 6).
- `grep -n -F 'list each rule it breaks'` -> line 46:
  - 33 words (section E), with three requirements (one rule per bullet).
  - "the finding names each one, and the replacement ends each" restates fix 1's rewrite of `SKILL.md:131`.
- `grep -n -F 'read the replacement as text'` -> line 47: it restates `SKILL.md:126-127`, and is 26 words.
- `grep -n -F 'count the words of each sentence'` -> line 48: holds.
- `grep -n -F 'compare the replacement with the passage word by word'` -> line 49: 35 words, two requirements, and it restates `SKILL.md:133-137`.
- `grep -n -F 'list each technical term and abbreviation'` -> line 50:
  - 46 words (section E), with three requirements.
  - Its last clause restates `rules.md`, "Terms defined at first use", the bullets on a term the replacement brings in.
  - "counted from the title" repeats fix 5.
- `grep -n -F 'check each relation or limit'` -> line 51: "its tables included" drops "and figures" from `SKILL.md:138` ("its tables and figures included"). The operation's scope is narrower than the rule it applies (`docs/dev/change-standard.md`, rule 17).
- `grep -n -F 'read each bracket that holds'` -> line 52: it restates fix 3's "or" sentence and `SKILL.md:146`.
- `grep -n -F 'for a split, count'` -> line 53: two requirements, and no condition (section 5, finding 4).
- `grep -n -F 'check that the named rule'` -> line 54: it restates `SKILL.md:106-107` word for word (section 5, finding 3).
- Lines 45 to 54 taken together:
  - Item 8 (line 44) asks that each operation name "the part of the prompt or the page whose rule it applies" and restate "none of those rules". The dictated operations name no part and restate rules (lines 46, 47, 49, 50, 52, 54). The builder cannot follow both.
  - The item calls them operations carried out "in order", yet dictates them as a bulleted list, against `docs/dev/skill-layout.md`, "Lists and tables" ("A numbered list means order"). A numbered sub-list under the one bullet keeps Decision 4's "one bullet".
- `grep -n -F 'For each group line'` -> line 55: "Then list every place the report gives, and check that none stands twice." tests the place, which the split form and several findings at one paragraph make false (section 5, finding 6).
- `grep -n -F 'what the reader believes, does or cannot do wrong'` -> line 56: "cannot do wrong" reads as "cannot err". A wording that says what is meant: "what the reader wrongly believes or does, or cannot do".

Findings:
1. Line 37: seven items in paragraph form, 48 words, and the tense example misstated.
2. Line 39: does not name `SKILL.md:146` (and `:145`) as the sentences it replaces.
3. Line 40: "never a narrower" can be read against "Most specific term".
4. Line 41: a second reading order beside "What you read", and a list of parts that is not whole.
5. Line 42: covers "in recent years".
6. Line 43: the draft's own phrase as the example, and a definition that is false as written.
7. Lines 44 to 55:
   - the requirement to name a part and restate none is contradicted by the dictated lines;
   - an ordered sequence is dictated as bullets;
   - lines 45, 46, 49, 50 and 53 join several requirements;
   - lines 46, 47, 49 and 50 run over section E's length;
   - line 51 narrows `SKILL.md:138`;
   - lines 45 and 55 test the place, not the passage.
8. Line 56: "cannot do wrong".

## Declined to judge

- Whether turning the last pass's checks into an ordered sequence of operations changes what the review agent does: this cannot be settled by reading. Under ruling I no run follows, so this is the user's to weigh at the closing.
- Whether "robust performance estimates" from cross-validation in the draft is the statistical sense: the two markers split (`8-marks.md`, 11.4). Fix 7 takes marker 1's side, which is a domain judgment. Only the wording of the rule is judged above.
- Whether the 17 marks without a reason of their own hide a wrong row, 12.1 to 12.9 among them, which C10 uses as rows right by both: this cannot be settled without new marks, and it is the closing's and the user's.
- Whether a fixed reading of the sentence-length threshold is the user's choice or the orchestrator's under self-rule: it touches the user's prose standard, within ADRs 0001 and 0002.
- Mapping only, with no fix missing:
  - Grant 7b's other reasons ("atlas" first used at paragraph 25, "matched" dropped) are reached by fix 5's last sentence and operation 5, though the brief lists 7b under fix 1 only.
  - Grant 8c's article change is reached by operation 5, though it is listed under fix 1 only.

  The builder's table should name those sentences.

Agent usage: aa2534267459358b5, claude-opus-5-5, 216006 tokens, 43 tool uses, 9.8 minutes.

## Closed

- 2 (the step line leaves out the 17 marks): step 9's line in `plan.md` now reads "the failures of gate condition 6 concern the markers' prompts, commands and reasons, no text of `/writing`"; the brief's condition 6 premise quotes it.
- 3 (22 grant rows): the premise now reads 26 grant rows.
- 3 (line 15's "to say so"): closed with finding 2.
- 5.1 (the length threshold for 11c, 11d, 11e and 7b): fix 1 adds the sentence that keeps the report's reading of the length rule even, no sentence a replacement writes being as long as one the report names as over the rule; Decision 6 records why no number of words is stated.
- 5.2 ("the named rule" at lines 128, 129, 133, 134 and 136): fix 1 rewrites them to "a rule the finding names".
- 5.3 (operations 7, 9 and 10 repeat old checks): fix 8's operations now say how: operation 4 quotes the rule's words and reads each exception, operation 5 finds every other place stating a claim under "Evidence for claims", operation 12 lists every measure of the property in text, tables and figures, operation 14 writes each part out after every finding and counts it.
- 5.4 (row 1c): fix 8 rewrites line 161 so the condition rule covers a sentence split and moves it out of the paragraph-split forms; operation 10 finds each condition and the parts it governs.
- 5.5 (the group 9 heading): operation 3 checks each entry under a table's rows stands under its own section's row.
- 5.6 (operations 1 and 11 test the place): operation 2 now finds the same or overlapping quoted words at a place, outside the split form; C8 adds the eight findings at grant paragraph 42 as findings that stay.
- 5.7 (fix 6 covers "in recent years"): fix 6 now names the two rows, "many studies" and "some researchers"; the other rows cover their own phrase only. Decision 2 says the same.
- 5.8 (C9 has no control): C9 adds the lines of manuscript group 1 and grant group 2.
- 8.1 (line 37): the kinds are a list, and the tense item reads "a change of tense or of voice that the finding does not name".
- 8.2 (line 39): fix 3 names `SKILL.md` lines 145 and 146 as the sentences it replaces.
- 8.3 (line 40): fix 4 keeps line 142's exception for "Most specific term".
- 8.4 (line 41): fix 5 reads a `.tex` draft from the main file's first line, its title included, in the order "What you read" gives.
- 8.5 (line 42): closed with 5.7.
- 8.6 (line 43): fix 7's example is "robust estimator" only, and the sense is an estimate or a method insensitive to outliers, to departures from the model's assumptions or to the partition of the data.
- 8.7 (lines 44 to 55): the operations are a numbered list; each does one thing and names its part in parentheses; the brief says what each does and the builder words each within section E and the one-rule-per-bullet rule, so no line is dictated; operation 12 reads "text, tables and figures"; operations 1 and 2 test the quoted words.
- 8.8 (line 56): fix 9 reads "what the reader wrongly believes or does, or cannot do".
- Declined to judge, mapping: fix 8's list now names grant 7b ("matched" dropped) and 8c (the article).

# Step 3a brief check (on main at 68e2dce)

The brief checked is `/Users/axelfaes/workspace/ordo/.scratch/2-h-session-retro/agents/briefs/3a.md`. Nothing was written. `git status --short` at the end prints the two modified ledger files and the untracked `2a-report.md`, `2a-round-0.diff`, `3a.md` of the start, plus `?? .scratch/2-g-git-guard/agents/briefs/2a.md`, which another session wrote during this run.

## 1. Names

- "Dictated text", "word for word": `git grep -n -i 'dictated text\|dictated' -- . ':!.scratch'` prints nothing; `git grep -n -i 'word for word' -- . ':!.scratch'` prints `skills/diagnose/SKILL.md:61` (the symptom copied word for word, unrelated) and `skills/repo-setup/templates/hooks/git_guard.py:571` (code). Neither is made false.
- Counts of checks and headings: `grep -rn 'seven checks\|six checks\|four items\|two placeholder' skills docs README.md` prints nothing, exit 1; `git grep -n -i -E '(six|seven|eight|[0-9]) (checks|headings)' -- skills docs README.md utils` prints nothing. No page counts the checks.
- "brief check": `git grep -n -i 'brief.check' -- skills docs README.md utils` prints hits in `README.md:38`, `docs/figures/gen_figures.py:584`, `docs/figures/plan-loop.svg:20`, `docs/glossary.md` (10, 16, 23, 30, 36, 38, 40, 74, 78, 91, 94, 113) and the same entries in `skills/repo-setup/templates/plan-terms.md`, `docs/roadmap.md:222`, `skills/diagnose/SKILL.md` (18, 42, 47, 81, 170), `skills/grill/SKILL.md:121`, `skills/land/SKILL.md:91`, `skills/ordo-help/SKILL.md` (59, 60, 61, 74), `skills/plan-orchestration/SKILL.md` (28, 51, 52, 129, 134, 137, 291), `skills/plan/templates/orchestrator-state.md` (14, 27, 31), `skills/plan/templates/plan.yaml` (12, 27). Each was read: none lists or counts the checks or the report's headings, and none is made false. The glossary's **brief check**, **Closed**, **Declined to judge**, **finding** and **question, the** entries hold after the change.
- The report's parts: `git grep -n -i "first run\|first read" -- skills docs README.md utils ':!skills/spec'`, `git grep -n -i 'DONE / NOT DONE\|NOT DONE'`, `git grep -n -i 'verbatim'`, `git grep -n 'Verify before you report\|"Cases"' ... ':!skills/spec'`, `git grep -n -i 'judgment call\|line counts\|Doc text\|the report quotes\|the report names\|the report lists' ...`. Hits read: `docs/dev/change-standard.md:33` (rule 7), `:39` to `:44` (rule 13), the same lines of `skills/repo-setup/templates/docs/dev/change-standard.md`, `skills/refute/SKILL.md:58`, `:102`, `:103`, `:114`, `skills/refute/templates/report.md:8`, `:9`, `:18`, `skills/plan-orchestration/SKILL.md:66`, `:85`, `:261`, `docs/glossary.md:19` (**case**), `:37` (**Doc text**), `:46` (**hand-back**).
- Mutation and revert: `git grep -n -i 'revert\|mutat\|code under test' -- skills docs/dev README.md` prints `docs/dev/change-standard.md:36`, `:39`, the same two lines of the `repo-setup` template copy, `skills/land/SKILL.md:203`, `:205`, `shared-rules.md:24`, `coding-standards/cpp.md:60`. No page has "mutation" or "code under test".
- "the repository's glossary": `git grep -n -i 'glossary' -- skills ':!skills/repo-setup/templates/plan-terms.md'` prints, among others, `skills/diagnose/SKILL.md:34` ("`docs/glossary.md` and the ADRs in force ..., each when the repository has it"), `skills/grill/SKILL.md:43` to `:45`, `skills/ordo-init/SKILL.md:67`, `skills/repo-setup/SKILL.md:145`.
- `README.md` and `docs/figures/gen_figures.py`: the only hits are `README.md:38` and `gen_figures.py:584`, neither about the checks or the report.

Findings:

1. `docs/dev/change-standard.md:39` and `skills/repo-setup/templates/docs/dev/change-standard.md:39` (rule 13, identical in both): "The report quotes each run verbatim beside the test's name and names no revert", and its fourth bullet, "The reviewer finds such a test by reading it". Item 4's new paragraph asks the report to name a change to the code under test and the failing line with it made. The two statements contradict each other in every repository whose rules file is that page; the detail is in section 4, finding 1. Both files are outside "Paths this step writes".
2. `skills/refute/SKILL.md:102` to `:103` and `:112` to `:114` ("The four headings"): the list of Spec and Proof findings has "a case whose first run on the unchanged tree the report does not give" and nothing for a code case with no named change, or for a report with no terms section. The change leaves these sentences true and incomplete: a reviewer following `refute` has no finding kind for the two new report parts. The brief should either add `skills/refute/SKILL.md` to its paths with one bullet for each, or say in "Decisions" why the reviewer's list stays as it is.
3. `docs/dev/change-standard.md:33` and its template copy (rule 7) list the report's parts without a terms section. The sentence is not made false, since the brief template already adds the cases' first run, which rule 7 does not list either. No change asked; named because the instruction asks for each such sentence.
4. `skills/spec/SKILL.md` Steps 4, outside the six items but inside the file the step writes: "The report shape, with the cases' first run before the result table" and the bullet on "Cases" ("the builder's first task as the template states it: the first run of every case ..., a case of a code step as a test ...") become incomplete: neither names the terms section or the named change per code case. None becomes false. R8 leaves this judgment to the builder's report. The session writing the brief can settle it now: the brief should say "Steps 4 stays as it is; its two sentences name the template for the detail" as a Decision, or add an item with the text, and R8 then checks that decision instead of asking the builder to make it.

## 2. The step line

- The step line, `sed -n 30p .scratch/2-h-session-retro/plan.md`: "3a The six changes of the ruling "Recurring findings" to `skills/spec/SKILL.md` and `skills/spec/templates/brief.md`; check: each changed text read in place, and `grep -c` of each new sentence in its file (1 commit) (ruling Recurring findings)".
- "The six changes": kind 1 is items 1 and 2; kind 2 is item 6, sentences 1 to 3; kind 3 is item 6, sentence 4; kind 4 is item 5; kind 5 is item 4; kind 6 is item 3. Every proposal has an item.
- "to `skills/spec/SKILL.md` and `skills/spec/templates/brief.md`": items 1, 3, 4, 5, 6. Item 2 writes `skills/spec/templates/brief-check.md`, which the step line does not name.
- "each changed text read in place": cases R1 to R6 and "Verify" 6. "`grep -c` of each new sentence in its file": "Verify" 2.
- The six wordings, the open item (`git show f8b51cf:.scratch/2-h-session-retro/orchestrator-state.md`, "Open items") against the brief:
  - Kind 1: the brief replaces "the prose standard, `docs/dev/skill-layout.md` and the glossary" by "the rules file and the standards the configuration names" and adds "a message a script prints". In this repository `.agents/plan.yaml`'s `standards` is exactly those three pages (`cat .agents/plan.yaml`), so that part is the same rule. "The rules file" is an addition the open item did not have. The example added is inside a list of examples and changes no scope.
  - Kind 2: the brief keeps the clause on the case the brief's rules got wrong, which the open item's replacement dropped, and replaces "the ASCII command's line and its exit status included" by "a command that prints nothing given with its exit status". Same rule, stated for every command with empty output in place of one command.
  - Kind 3: "the repository's glossary" for `docs/glossary.md`, "the place the entry names" for "Stated in", "there" for "in the section it names". Same rule, same scope.
  - Kind 4: "past 25 words" becomes "longer than the standards allow", and "each Steps item" becomes "each new or changed Steps item". The threshold is not the same: in this repository it moves from 25 to the prose standard's "under roughly 20 words", and in a repository whose standards give no length the clause asks nothing. The second change narrows the clause to new or changed items and is not listed under "Decisions".
  - Kind 5 and kind 6: the open item's words, unchanged.
- The count of checks: `git show f8b51cf:skills/spec/SKILL.md | grep -n -A8 'The agent runs these checks'` prints seven check bullets, **ADRs** among them, at the commit the open item is read from, while the open item's text says "checks names, the step line, premises, cases, the question and implied inputs".

Findings:

1. The step line names two files and the brief writes three. `skills/spec/SKILL.md` Steps 2 says a premise the plan can absorb "is corrected in `plan.md` before the brief exists" and "the brief records the correction beside the premise". The step line should read "to the `spec` skill (`skills/spec/SKILL.md`, `templates/brief.md` and `templates/brief-check.md`)", and the brief's "What is on the tree" should record that correction; "Decisions" 6 gives the reason and not the correction.
2. The ruling line in `plan.md` still ends "each in the words the open item gives", and the brief departs from those words in the places "Decisions" 1 to 5 list. Four of the five keep the rule. "Decisions" 4 changes the number Axel ruled on (25) to another threshold, and the brief's sentence "the rule each states is unchanged" ("What is on the tree", the bullet on the ruling) is not true for it. The brief should state Decision 4 as a change of the threshold, and `plan.md`'s Rulings should carry a line for the departures, as the plan's earlier "decided by the orchestrator" lines do, or the point goes to Axel as an open item. Which of the two is the orchestrator's call under "Steps / The brief check" 4 (a choice the user would see is a stop).
3. "Decisions" 1 does not say that "the rules file" is added to what a dictated text is read against. It should say so with the reason, or the dictated bullet should drop it.
4. The narrowing "each new or changed Steps item" is a choice with no entry under "Decisions". It should have one.
5. "What is on the tree", the bullet on the count of checks, says "The ruling's open item was written when the list had six". The list had seven at `f8b51cf`; the open item's text named six. The corrected ruling line in `plan.md` repeats it ("since the ADRs check landed after the open item was written"). Both should say that the open item counted six where the skill had seven.

## 3. Premises

- `wc -l skills/spec/SKILL.md skills/spec/templates/brief.md skills/spec/templates/brief-check.md` prints 296, 67, 55. Matches.
- `grep -n 'The agent runs these checks' -A 8 skills/spec/SKILL.md` prints line 238, the seven check bullets at 239 to 245 in the order the brief gives, and "The checks are done ..." at 246. Matches.
- `grep -n 'one heading per check' skills/spec/SKILL.md` prints line 247; `grep -n '^## ' skills/spec/templates/brief-check.md` prints `## 1. Names` (5) to `## 7. ADRs` (41), `## Declined to judge` (47), `## Closed ...` (53); the usage line is at 51. Matches.
- `grep -n '^- <\|^The builder.s first task\|^When the first run' skills/spec/templates/brief.md` prints the two "Cases" bullets at 18 and 19, the paragraphs at 21 and 23. Matches.
- `grep -n '^[0-9]\. ' skills/spec/templates/brief.md` prints items 1 to 4 of "Verify before you report" at 60 to 63. Matches.
- `grep -n -o` of the two quoted sentences in `brief.md` prints them whole at line 67. Matches.
- `grep -n -i 'glossary\|prose standard\|skill-layout' skills/spec/SKILL.md skills/spec/templates/*.md` prints nothing, exit 1. Matches. `skills/spec/SKILL.md:231` has "the rules file and the standards the configuration names"; `brief.md:3` has "<the standards the configuration lists>". `grep -n 'The skills carry no project name' docs/dev/change-standard.md` prints line 85 with the quoted sentence. Matches.
- `grep -n 'under roughly 20 words' skills/repo-setup/templates/docs/dev/prose-standard.md` prints line 64, "E. Sentence shapes". Matches.
- `grep -n -o 'each in the words the open item gives' .scratch/2-h-session-retro/plan.md` prints line 50. `git diff .scratch/2-h-session-retro/plan.md` shows the ruling line changed from "the brief check's seventh check of dictated text" to "the brief check's check of dictated text (the eighth check, ...)", uncommitted. Matches.
- `ls docs/adr` prints `README.md` and `template.md`. Matches.
- The verify list: an `awk` count of the `- ` lines between `verify:` and `rules:` in the state file prints 10, which is the number "Verify" 1 expects.
- `LC_ALL=C grep -n '[^ -~]'` over the three files prints nothing, exit 1, on the unchanged tree.

Findings:

1. "What is on the tree", the bullet on the ruling: "Three of those wordings name a page or a number of this repository". Four do: kind 1 (the prose standard, `docs/dev/skill-layout.md`, the glossary), kind 2 (the ASCII command), kind 3 (`docs/glossary.md`, "Stated in"), kind 4 (25 words). The same sentence then points at four Decisions. It should say "Four".
2. The same bullet and "Decisions" 1 and 2 rest on "the skill names no path of one repository". `docs/glossary.md` is the path `repo-setup` gives every repository, and other skills name it with a condition: `skills/diagnose/SKILL.md:34`, "`docs/glossary.md` ..., each when the repository has it". The premise should say that, since it decides how item 6's terms sentence is worded (section 5, finding 4).

## 4. Cases and checks

- R1 to R6 read against the rules file, rule 1 (a defect in text is fixed by reading, the report quotes the text before and after) and rule 17: consistent.
- R7 and R8 read against rule 14 and rule 19: R7 is consistent; R8 is in section 1, finding 4.
- "Verify" 1 against "Commands and their filters": consistent. "Verify" 2, 4, 5: facts a command computes, consistent with "Scripts compute facts; judgment is read". "Verify" 6: a reading, consistent.
- "Verify" 3 against the diff the items produce, computed in memory with `python3` and `difflib` from `skills/spec/templates/brief.md` and the six texts: `brief.md` gets 5 lines with `+` and 1 with `-`, which is four added lines (the third bullet, the new paragraph, the blank line after it, item 5) and one changed line. `brief-check.md` gets 6 added lines, three of them blank. `SKILL.md` gets 1.
- The six new texts against rule 7, rule 13, rule 15 and "Scripts compute facts; judgment is read", and against the other sentences of the three files.

Findings:

1. Item 4 contradicts rule 13 of the rules file, in both copies. Rule 13: "The report quotes each run verbatim beside the test's name and names no revert", and "A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof ... The reviewer finds such a test by reading it." Item 4: "the report names one small change to the code under test that the case must catch, and the test's failing line with that change made." A change that takes the behaviour out of the code is a revert of part of the step, named in the report. The open item's sentence "This reopens nothing of 2.E step 8's rule 13, which is about naming reverts in test comments" does not match rule 13 on main, which speaks of the report. The brief check of 2.F step 2a raised the same clash on that brief (`.scratch/2-f-diagnose/agents/reviews/2a-brief-check.md`, section 4, finding 7) and it was closed there by saying the runs are the proof rule 13's fourth bullet asks for, listed in rule 13's table. The brief for 3a says nothing of rule 13. It should quote rule 13's sentence under "What is on the tree" and then do one of two things, which is the orchestrator's or Axel's to choose: reword item 4 so it names rule 13's table and the proof its fourth bullet asks for (wording in section 8, finding 4), with rule 13's "names no revert" and "by reading" sentences amended in both copies of the change standard in this step and the paths widened; or raise the clash to Axel, whose ruling rested on the open item's description of rule 13.
2. Item 3 contradicts the bullet before it and rule 15. The second "Cases" bullet already names "a missing or unreadable file, an empty value, a malformed line" and limits them to "only the inputs where a wrong answer costs something, as the rules file's rule on edges weighs them". The new bullet asks for "each input it reads that is missing, unreadable or malformed" with no limit. Rule 15: "a form of input its own rules name is a case only when a wrong answer on it costs something"; "Scripts compute facts; judgment is read": "A test exists only for a script, and only for behaviour whose failure costs something"; `skills/refute/SKILL.md`, "The four headings", Standards, makes a test of behaviour whose failure costs nothing a finding. A brief written from the changed template lists cases the reviewer then reports. The same forms are also stated twice, against `docs/dev/skill-layout.md`, "Where a rule goes" ("A rule is written once"). The brief should fold the new forms into the second bullet, or give the third bullet the same limit (wording in section 8, finding 3).
3. "Verify" 3 says "in `brief.md` three added lines and one changed line". The items produce four added lines, one of them blank. It should say "four added lines, one of them blank, and one changed line", and for `brief-check.md` "six added lines, three of them blank".
4. "What to build", the paragraph after item 6: "A text that breaks one of them is a hand-back before any change, as "Cases" says". "Cases" speaks of a case the brief's rules get wrong, not of a dictated text. The sentence should cite the rules file's rule 4 ("a rewrite of text the brief dictates ... is reported as a stop"), and it should name the glossary with the two other standards.
5. Item 6 drops "with its result on the unchanged tree" from the first sentence. The glossary's **case** entry defines the first run as the run on the unchanged tree, so the scope holds through the term, but the sentence no longer asks for a result, only for "its output as printed", and a reading has no printed output. Under rule 17 the brief should keep the old words (wording in section 8, finding 6).

## 5. The question

- R1, R3, R5 (counts and places read before and after): no. Each is a reading of the exact place, and the text is compared with the brief's.
- R2: yes, in one respect. "In the form of the seven before it" holds for a section that has no line for a brief with no dictated text (section 8, finding 2).
- R4, R6: no for placement and wording. Yes for the goal; see findings 1, 2, 3 and 5.
- R7: yes. The four phrases of its first grep are in no file now, so that grep passes whatever the change does; the reading of the "brief check" hits is what carries the case, and it does not reach `skills/refute/SKILL.md`'s list of findings or rule 13 (section 1).
- R8: yes. It asks the builder to judge what the brief can settle (section 1, finding 4).
- The check on the step's line ("each changed text read in place, and `grep -c` of each new sentence"): yes. `grep -c` of a phrase prints 1 for a sentence whose other words differ, and for item 2 only the heading is grepped. The reading covers it only if the reader compares with the brief's text.
- Item 1 (the check of dictated text): yes. Kind 1 is "text a brief dictates word for word that breaks a standard or is false". The bullet reads the text against the rules file and the standards, and nothing asks whether a dictated sentence is true on the tree. 2.H step 3's finding on the entry's claim about secrets is of that kind.
- Item 2: yes, as R2.
- Item 3: yes. "Its output closed early" and "the one error line expected" are read correctly only by someone who knows Ordo's scripts (section 8, finding 3).
- Item 4: yes. The builder chooses the change, and "that the case must catch" does not tie it to the behaviour the case names. A change that removes a whole function is caught by every test, and kind 5 (the behaviour named by the case mutated, the test still green) stays. The sentence also does not say where in the report the lines go.
- Item 5: yes. In a repository that is not Ordo, "Steps item" names nothing: `ls skills/repo-setup/templates/docs/dev` prints `change-standard.md`, `coding-standards`, `design-principles.md`, `prose-standard.md`, `ui-standard.md`, so `skill-layout.md` is not shipped, and the template `plan.yaml` has `standards: []`. There the item either asks nothing or imposes a rule no standard of that repository states.
- Item 6, first three sentences: yes for one point. A brief written from the template has cases with no names (the "Cases" placeholders give "the input, then its expected result"), so "by its name" cannot be followed.
- Item 6, the terms sentence: yes, on three points; see findings 4, 5 and 6.
- "Verify" 1, 3, 4, 5: no, each is a fact. "Verify" 2: yes, as the step line's check. "Verify" 6: no.

Findings:

1. Item 1 does not serve the "or is false" half of kind 1. The brief should either add to the bullet "and each claim it makes about the tree is checked as a premise is", which is a change of scope for the orchestrator to rule, or say under "Decisions" that falsity is left to the **Premises** check and why that covers a sentence the brief dictates.
2. Item 4 can be met with a change unrelated to the case's behaviour. The dictated sentence should say "one small change to the code under test that takes out the behaviour the case names".
3. Item 5 carries Ordo's layout rule into every repository. The dictated text should name the rule by its source, as the template does elsewhere ("as the rules file's rule on edges weighs them"): wording in section 8, finding 5.
4. Item 6, terms: "the repository's glossary" gives no answer in a repository with none, and "the place the entry names" does not exist for a project term, whose form in `skills/repo-setup/templates/docs/glossary.md` is "- **<term>**: <definition, one or two sentences>." The sentence should carry "when the repository has one" and "when the entry names one".
5. Item 6, terms: the sentence says what is read and not what the report writes. "Terms: case, finding; read" would meet it. It should say what each term's line holds: the term, the line of the diff that uses it, and whether the use is in a sense its entry gives.
6. Item 6, terms: two halves of kind 3 are not reached. An entry the diff does not change but makes false (2.F step 1, "stale "Stated in" places"; 2.H step 3, the nine uses of "the reader") is outside "each changed entry". And "checked by `grep -n` of the term there" shows that the word occurs, not that the place states the term (2.E step 11), and it fails on a qualified headword such as **case, of a diagnosis**. The sentence should ask for each entry the diff changes or whose named place the diff changes, and for the line of that place that states the term, quoted as `grep -n` prints it.
7. "By its name" has nothing to name in a brief written from the template. Either the first "Cases" placeholder gains "each under a short name", which is a seventh change, or the sentence says "every case of "Cases", in the brief's order, none left out".
8. "Verify" 2 should grep each dictated text whole, with `grep -c -F -- '<the text>' <file>` printing 1, and should have a line for item 2's bullet and its Findings line.

## 6. Implied inputs

- Not a code step. The brief says so ("This is a text step: nothing in it is a script, and it has no test"), and the three paths besides the report are Markdown (`ls skills/spec skills/spec/templates`).

Findings: none

## 7. ADRs

- `ls docs/adr | grep -E '^[0-9]{4}-'` prints nothing, exit 1; the folder holds `README.md` and `template.md`. No record. The brief says "No ADR touches this step" and "No ADR record exists", which matches.

Findings: none

## 8. Dictated text

- Word counts, computed with `python3` over the six texts: item 1, 47 words in one sentence; item 2's bullet, 44; item 3, 30; item 4, 32; item 5, 18 and 20; item 6, 47, 26, 8 and 44. The neighbours of item 1 run 42, 37, 24, 25, 51, 39 and 78 words (`sed -n 239,245p skills/spec/SKILL.md | awk '{print NF}'`). The "Report" paragraph goes from 7 sentences to 9. The six texts hold one semicolon, in item 2.
- Glossary senses, each term read against `docs/glossary.md`: "brief", "case", "first run", "finding", "rules file", "standards", "orchestrator", "ruling" (its second sense), "step" in "code step" and "Steps item" (its second sense) are used as defined. "Place" is used in its plain sense; the glossary's headword is the qualified **place, of a point**. "Dictated text" is a check's label defined by its own bullet, as "Implied inputs" and "Names" are, and those have no entry.
- Placement by `docs/dev/skill-layout.md`, "Where a rule goes": item 1 is a rule for one point of the work and sits in that step's item; correct. Items 2, 3, 5 and 6 sit in the template section they belong to. Item 4 is not; see finding 4.

Findings:

1. Item 1, "as a diff would be". The clause tells the agent nothing it can do: `docs/dev/skill-layout.md`, "Writing for an agent", "A sentence stays only when it changes what the reader does". The glossary's **standards** entry has the words for it. Also 47 words in one sentence with two actions (read, name), against the prose standard, "E. Sentence shapes", sentence length; its neighbours split ("**ADRs.**" has three sentences). Wording: "**Dictated text.** Every text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints) is read against the rules file and the standards the configuration names, as the reviewer holds a diff to them. Each place a text breaks one is named, with the rule."
2. Item 2. The bullet ends "; or no breach", where every neighbour uses "or the rule it breaks, named with its file and section" and a closing "Or: ..." for the empty case ("Or: not a code step.", "Or: no record."). "Breach" is a second word for "breaks" (prose standard, "D. Structure", no synonym cycling), and "named by" stands beside the neighbours' "named with". There is no line for a brief that gives no text word for word. Wording: "- <each text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints)>: consistent with the rules file and the standards, or the rule it breaks, named with its file and section. Or: no text given word for word."
3. Item 3. "Its output closed early" is shorthand a reader outside this repository cannot act on (prose standard, "0. Hard rules", plain prose; the user's rule on unexplained jargon), and the bullet repeats the forms of the bullet before it without its limit (section 4, finding 2). Wording, as a third bullet: "- <for a script, each file or value it reads that is missing, unreadable or malformed, and the case where the program reading its output closes it before the script ends, each with the exit status and the error line expected; only where a wrong answer costs something, as the rules file's rule on edges weighs them>." Removing "a missing or unreadable file" and "a malformed line" from the second bullet would end the repeat; that is a change to a line the brief does not list and needs an item.
4. Item 4. It breaks rule 13 as written (section 4, finding 1), does not tie the change to the case (section 5, finding 2), and is a rule about the report placed in "Cases" while "Report" gives the report's parts in order and has no place for it (`docs/dev/skill-layout.md`, "Writing for an agent", "One meaning has one place"). It also does not say the change is taken out again. Wording, if the orchestrator keeps the item: in "Cases", "For each case of a code step, the builder makes one small change to the code under test that takes out the behaviour the case names, runs the case's test, and takes the change out again."; and in "Report", after the first-run sentence, "For each case of a code step, the table the rules file's rule on tests asks for gives that change and the test's failing line with it made."
5. Item 5. The item holds three requirements in two sentences; its neighbour item 4 does the same, so the form matches the file, but the text states Ordo's rule as every repository's (section 5, finding 3), does not say which bullets it means, and opens with a label no neighbour has. "Longer than the standards allow" also drops the prose standard's own exception without naming it. Wording: "5. Each bullet, list item and sentence the diff adds or changes in a page or a skill is read against the standards' rules on lists and on sentence length. A sentence longer than they allow is named in the report with the reason its content needs the length."
6. Item 6, sentences 1 to 3. "Its output as printed" has no meaning for a reading; "by its name" has no referent in the template (section 5, finding 7); "as printed" and "verbatim" are two words for one thing in three sentences (prose standard, "D. Structure", no synonym cycling); "A line shortened with "..." is not verbatim" is a bare prohibition (`docs/dev/skill-layout.md`, "Writing for an agent", first bullet: the rule names the behaviour to do instead); sentence 1 has 47 words. Wording: "Then the cases' first run: every case of "Cases", in the brief's order, none left out. Each case has the command that checked it and its output verbatim, or the reading and what it found on the unchanged tree. Each case the brief's rules got wrong has the rule, the result and the orchestrator's ruling. Then the DONE / NOT DONE table with the checks above and their output verbatim; a command that prints nothing is given with its exit status, and a long line is quoted whole, never shortened with "..."."
7. Item 6, sentence 4. 44 words, and the gaps of section 5, findings 4 to 6. Wording: "Then the terms, when the repository has a glossary: each term of it that the diff adds, changes or uses, with the line that uses it and whether the use is in a sense its entry gives. For each entry the diff changes, and each entry whose named place the diff changes, the line of that place that states the term is quoted as `grep -n` prints it."
8. The "Report" paragraph after item 6 has 9 sentences, each a part of the report in order. The prose standard, "D. Structure", says a paragraph stays under roughly four sentences and that three or more list-shaped items in paragraph form become a list. The paragraph has 7 on main, so the defect is there already and the item adds to it. Turning it into a numbered list is a change beyond the six and is the orchestrator's to decide; the brief should say under "Decisions" that the paragraph keeps its form, and why.

## Declined to judge

- Whether the departures from the open item's words ("Decisions" 1 to 5, and the wordings proposed in section 8) need Axel's ruling or a line decided by the orchestrator. It is the user's call; section 2, finding 2 and section 4, finding 1 give the facts.
- Whether "Dictated text" needs a glossary entry. `docs/dev/skill-layout.md`, "Writing for an agent", asks for an entry for a term used in a sense of its own; the other check labels without an entry ("Names", "Implied inputs") point the other way. A read does not settle it.
- `sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md` was not run, since it runs the test suites, which create scratch folders, and this check writes nothing. Only the count of its commands (10) was checked.
- Nothing under `.agents/worktrees/` was read. The brief's paths were compared only with the "Paths this step writes" of `.scratch/2-f-diagnose/agents/briefs/2a.md`, the one step a dispatch block on main names (`grep -n -A12 '^dispatch' .scratch/2-f-diagnose/orchestrator-state.md`): no file in common. `.scratch/2-g-git-guard/agents/briefs/2a.md` appeared during this run and was not read.
- The claim in "Decisions" 5 that the 2.F step 2a brief check "found most of its dictated-text findings" in messages a script prints was not counted; `grep -n -i 'dictat\|message\|prints' .scratch/2-f-diagnose/agents/reviews/2a-brief-check.md` shows findings on a dictated error line and on "What it must do", which is consistent with it and does not prove "most".

Agent usage: claude-opus-5-5 (ordo-high), 195356 tokens, 30 tool uses, 7.6 minutes ($1.30 to $4.62).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Section 2 finding 2, section 4 finding 1 and section 1 finding 1 (the ruled words depart from the open item's, and the change of kind 5 contradicts rule 13 of the change standard): a stop, the open item "Step 3a, the words of the six changes" as the state file holds it. The brief is not kept: no brief, worktree or dispatch entry exists for the step.
- Every other finding (sections 1, 2, 3, 4, 5 and 8): carried into option (a) of that open item as the corrected wording of each change, the widened paths and the two findings for `refute`; the next `/spec 2.H 3a` writes the brief from the ruling.

# Step 3a brief check (on main at 6f40399)

The brief checked is `/Users/axelfaes/workspace/ordo/.scratch/2-h-session-retro/agents/briefs/3a.md` (163 lines). `git rev-parse --short HEAD` printed `6f40399` at the start and at the end. I wrote nothing in the repository; the scratch folder `$TMPDIR/bc-3a.FHQ8oP` is removed (`ls -d "$TMPDIR"/bc-3a.*` finds nothing). `git status --short` at the end prints:

```
 M .scratch/2-g-git-guard/orchestrator-state.md
 M .scratch/2-g-git-guard/plan.md
 M .scratch/2-h-session-retro/orchestrator-state.md
 M .scratch/2-h-session-retro/plan.md
?? .scratch/2-g-git-guard/agents/briefs/2b.md
?? .scratch/2-h-session-retro/agents/briefs/3a.md
```

The three `2-g-git-guard` lines were not there at the start of this run (the start printed only the two `2-h-session-retro` modified files and `3a.md`); another session wrote them while this check ran.

The two findings that matter most: the ruled words give the reviewer "a change of its own" while `refute`, the glossary and the README say the reviewer changes nothing (section 1, finding 1), and "Verify" 3 cannot hold as written (section 4, finding 1).

## 1. Names

Commands, all as `git grep -n -i -E '<pattern>' -- skills docs utils README.md`:

- `dictated|dictates`: `docs/dev/change-standard.md:30` and `skills/repo-setup/templates/docs/dev/change-standard.md:30` (rule 4, "a rewrite of text the brief dictates ... is reported as a stop"). Not made false; the brief's sentence after item 8 rests on it.
- `word for word`: `skills/diagnose/SKILL.md:61` (the symptom copied word for word) and `skills/repo-setup/templates/hooks/git_guard.py:571` (code). Not made false.
- `(six|seven|eight|[0-9]) (checks|headings|parts)`: no hit. No page counts the checks, the headings or the report's parts.
- `names no revert|by reading it|finds such a test`: `docs/dev/change-standard.md:39`, `:43`, the same two lines of the template copy, `skills/refute/SKILL.md:114` (all inside the paths), and `docs/roadmap.md:228` ("judged by reading its reports", an unrelated match). Not made false.
- `audit, not a proof|taken out of the code|takes (the|its) behaviour out|code under test|mutat`: the rule 13 lines, `skills/refute/SKILL.md:114`, `skills/spec/templates/brief.md:63` ("Verify" item 4: "is an audit, not a proof, and this brief says which it is"; inside the paths, stays true), and `skills/repo-setup/templates/docs/dev/coding-standards/cpp.md:60` ("mutator", unrelated).
- Rule 13 quoted or paraphrased, `rule 13|rule on tests|rule that a test` and the read of the `the report (quotes|names|lists|gives)` hits: `skills/repo-setup/templates/docs/dev/coding-standards/common.md:13` quotes rule 13's title ("Its rule "A test proves the change by failing on the unchanged tree, and the report quotes the failure" sets how the proof is shown"). The title does not change; not made false. `skills/diagnose/SKILL.md:149` and `skills/refute/SKILL.md:124` name the rule that a test exists only for behaviour whose failure costs something, which is not rule 13. `docs/dev/coding-standards` has no other quote.
- The shape of a builder's report, `first run|first read`, `DONE / NOT DONE|NOT DONE`, `judgment call|line counts|...`, `builder's report|the report's`: `docs/dev/change-standard.md:33` and the template copy's `:33` (rule 7, identical in both by `diff`), `skills/repo-setup/templates/shared-rules.md:6`, `skills/plan-orchestration/SKILL.md:66` ("the report path and shape"), `:85`, `:255` ("A builder's report keeps the shape of the repository's change standard"), `:261`, `skills/land/SKILL.md:100`, `docs/glossary.md:19` (**case**), `:37` (**Doc text**), `:46` (**hand-back**) and the same entries of `skills/repo-setup/templates/plan-terms.md`, `skills/refute/templates/report.md:8` to `:9`, `README.md:19`. None names the terms part or rule 13's table, and none is made false: rule 7 and `plan-orchestration` `:255` already list fewer parts than the template on main (neither has the cases' first run).
- The shape of the brief-check report, `brief.check`: `README.md:38`, `docs/figures/gen_figures.py:584`, `docs/figures/plan-loop.svg:20`, `docs/glossary.md:10`, `:16`, `:23`, `:30`, `:36`, `:38`, `:40`, `:74`, `:78`, `:91`, `:94`, `:113` and the same entries of `plan-terms.md`, `docs/roadmap.md:222`, `skills/diagnose/SKILL.md:18`, `:42`, `:47`, `:81`, `:170`, `skills/grill/SKILL.md:121`, `skills/land/SKILL.md:91`, `skills/ordo-help/SKILL.md:59` to `:61`, `:74`, `skills/plan-orchestration/SKILL.md:28`, `:51`, `:52`, `:129`, `:134`, `:137`, `:291`, `skills/plan/templates/orchestrator-state.md:14`, `:27`, `:31`, `skills/plan/templates/plan.yaml:12`, `:27`. None lists or counts the checks or the headings; none is made false. Inside the paths, `skills/spec/SKILL.md:247` ("one heading per check of item 2") holds with eight and eight.
- The "Report" section named as a paragraph: `"Report"|report shape|shape of .*report` prints `docs/glossary.md:15` and `:37`, `plan-terms.md:10` and `:32`, `skills/spec/SKILL.md:3` and `:102`; `git grep -n -i 'paragraph' -- skills/spec skills/refute skills/plan-orchestration docs/glossary.md skills/repo-setup/templates/plan-terms.md` prints nothing. No place calls it a paragraph. **Doc text** ("the section of a builder's report ... Stated in: `spec`, `templates/brief.md`, "Report"") holds with part 8 of the new list.
- The reviewer's own change, `changes nothing|without changing anything|edit to any file`: `README.md:5`, `docs/figures/gen_figures.py:599`, `docs/glossary.md:91`, `skills/repo-setup/templates/plan-terms.md:86`, `skills/refute/SKILL.md:3`, `:10`, `:168`, `skills/spec/SKILL.md:232` (the brief-check agent, unrelated), and hits on refusals and `utils/pin.sh` (unrelated).
- Scripts that read a changed file: `git grep -n 'change-standard\|brief-check\.md\|brief\.md' -- '*.py' '*.sh'` prints only `skills/ordo-init/templates/check_config.test.sh:26` and `:91`, which create an empty scratch file of that name. No script reads the content of any of the six files.

Findings:

1. Item 7's second change and item 8's Proof change give the reviewer a change to the code ("the reviewer checks it by reading the test and by a change of its own"; "or by a change of the reviewer's own that takes the behaviour out"). These places say the reviewer changes nothing, and the brief has no item for any of them:
   - `skills/refute/SKILL.md:3`: "Review a built step without changing anything" (inside the file the step writes, outside the items).
   - `skills/refute/SKILL.md:10`: "dispatches one reviewer, who changes nothing".
   - `skills/refute/SKILL.md:168`: "An edit to any file, anywhere, by the reviewer | The step under review is no longer the step that was built".
   - `docs/glossary.md:91` and `skills/repo-setup/templates/plan-terms.md:86` (**reviewer**): "refutes a built step without changing anything" (outside the paths).
   - `README.md:5`: "A fresh reviewer that changes nothing reviews the step"; `docs/figures/gen_figures.py:599`: "A fresh reviewer changes nothing" (outside the paths).
   
   The rules file's rule 19 asks that a contradicting statement be changed in the same step or reported as a stop. The practice on the tree is a change on a scratch copy: `.scratch/2-f-diagnose/agents/reviews/2a-refuter.md:53` reads "each mutation applied to a scratch copy of the script beside a copy of the test under `$TMPDIR`". A wording that would hold with every "changes nothing" sentence except `:168`: in rule 13, "the reviewer checks it by reading the test and by a change of its own on a scratch copy"; in the Proof bullet, "or by a change of the reviewer's own, made on a scratch copy outside the worktree, that takes the behaviour out"; and `:168` as "An edit to any file of the worktree or the main checkout by the reviewer". The rule 13 sentence is ruled text, so its change is the user's call; the Proof bullet and `:168` are the orchestrator's (Decision 4).

## 2. The step line

The step line, line 30 of `plan.md`, read with the Rulings lines 50 and 51 and "Step 0 of step 3a" option (a), lines 62 to 69.

- "The six changes of the ruling "Recurring findings"": kind 1 is items 1 and 2; kind 2 is item 6, parts 3 and 5; kind 3 is item 6, part 6, and item 8's Standards bullet; kind 4 is item 5; kind 5 is item 4, item 6 part 4, item 7 and item 8's Spec and Proof bullets; kind 6 is item 3.
- "to the `spec` skill (`SKILL.md`, `templates/brief.md`, `templates/brief-check.md`)": items 1, 3 to 6, 2. "`skills/refute/SKILL.md`": item 8. "rule 13 of both copies of the change standard": item 7.
- "check: each changed text read in place": cases R1 to R9 and "Verify" 7. "`grep -c -F` of each new sentence in its file": "Verify" 2.
- Ruling "Recurring findings": the dictated-text check (items 1, 2), "Report" with the first-run and verbatim wording and the terms (item 6), the reading item of "Verify before you report" (item 5), "Cases" with one change per code case and the missing, unreadable, malformed and closed-early inputs (items 4, 3). Ruling "Step 3a, the words of the six changes": rule 13 in both copies (item 7), the two findings of `refute` (item 8), section "8. Dictated text" (item 2). Every part has an item.
- Word for word, by a script that counted each ruled text of option (a) in `plan.md` and in the brief with `str.count`: the kind 1 bullet 1 and 1; kind 2's table sentence 1 and 1; kind 3 1 and 1; kind 4 1 and 1; kind 5's "Cases" sentence 1 and 1, its "Report" sentence 1 and 1, rule 13's first new sentence 1 and 1, its fourth bullet's new sentence 1 and 1; kind 6's list of forms 1 and 1; the two `refute` findings 1 and 1 each. Kind 2's first-run sentences are in the brief with "Then the" replaced by "The". A `difflib` comparison of line 19 of `brief.md` on main with item 3's bullet shows two insertions and nothing else: ", and for a script the case where the program reading its output closes it before the script ends" and ", for a script the exit status and the error line".
- Differences from option (a), and whether "Decisions" names each:
  - Item 6: each leading "Then" dropped and the next word capitalised, "First line:" as "The first line:", the numbers 1 to 8. Named by Decision 1.
  - Item 6, the opening line: "Write it to `<ledger>/agents/reviews/<step>-report.md`." gains ", with these parts in this order:". Item 6 gives it; Decision 1 does not name the added words.
  - Item 2's bullet and Findings line: Decision 2. Item 7's fifth bullet: Decision 3. Item 8's Proof bullet: Decision 4. Item 8's Standards placement: Decision 7.
  - Item 8's Spec bullet: the period of the bullet before it becomes a semicolon. Item 8 gives it; no Decision, and none is needed for list punctuation.
  - Item 4's place, between the paragraph "The builder's first task" and the paragraph "When the first run finds a case": the ruling says only "in "Cases"". No Decision names the place.

Findings:

1. The place of item 4's paragraph is a choice the brief takes without an entry under "Decisions". Section 8, finding 5 says why the place matters.
2. Decision 1 does not name the words ", with these parts in this order:" added to the opening line. They should be named there beside the dropped "Then".

## 3. Premises

- Bullet 1: `grep -n 'The agent runs these checks' -A 8 skills/spec/SKILL.md` prints line 238, the seven check bullets at 239 to 245 in the order the brief gives, and "The checks are done when each has its findings, or "none"." at 246. `grep -n 'one heading per check of item 2' skills/spec/SKILL.md` prints 247. Matches.
- Bullet 2: `grep -n '^## ' skills/spec/templates/brief-check.md` prints 5, 11, 17, 23, 29, 35, 41, 47 and 53; `grep -n '^Agent usage'` prints 51. Matches.
- Bullet 3: `grep -n '^- <\|^The builder.s first task\|^When the first run\|^[0-9]\. \|^Write it to' skills/spec/templates/brief.md` prints the two "Cases" bullets at 18 and 19, the paragraphs at 21 and 23, the four "Verify" items at 60 to 63, and "Write it to" at 67. A sentence split of line 67 gives 7 sentences. Matches.
- Bullet 4: the `diff` of the two `grep '^13\. ' -A5` outputs prints nothing, exit 0; both print lines 39 to 44. `grep -c -F` of each of the three quoted sentences prints 1 in each file; line 39 ends "names no revert." and line 43 ends "by reading it.". Matches.
- Bullet 5: `sed -n '93p;103p;104p;114p;115p;121p;125p' skills/refute/SKILL.md` prints the Spec label, "a case whose first run on the unchanged tree the report does not give.", the Proof label, the bullet ending "found by reading it (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).", the Standards label, the bullet "a sentence in a document, a head comment or a rules file that the diff makes false, ...;", and the Behaviour bullet. Matches. The section's list has one more bullet at line 126 ("Each finding, under any of the four headings, carries its failure scenario"), which no item touches.
- Bullet 6: `git grep -n 'names no revert\|by reading it' -- skills docs README.md utils` prints six lines: `docs/dev/change-standard.md:39`, `:43`, `docs/roadmap.md:228`, `skills/refute/SKILL.md:114`, and `:39` and `:43` of the template copy. Differs: see finding 1.
- Bullet 7: `plan.md` line 50 ("Recurring findings ... (the user)"), line 51 ("Step 3a, the words of the six changes ... (the user)"), line 60 ("Ruled (2026-09-30): Axel ruled (a)") and lines 62 to 69 hold option (a). Matches; the word-for-word result is in section 2.
- Bullet 8: `ls docs/adr` prints `README.md` and `template.md`. Matches.
- The header: `git rev-parse --short HEAD` prints `6f40399`. Matches.
- "Verify" 1's count: an `awk` count of the `- ` lines under `verify:` in `.scratch/2-h-session-retro/orchestrator-state.md` prints 11. Matches "checks: 11 commands passed".
- "Libraries checked": `cat .agents/plan.yaml` prints `libraries: avoid`. Matches.

Findings:

1. Bullet 6 says the grep "prints only" the rule 13 lines and `skills/refute/SKILL.md:114`. It also prints `docs/roadmap.md:228`, where "by reading it" matches "judged by reading its reports". The bullet should name that line as an unrelated hit. "Verify" 6 uses the narrower pattern `finds such a test by reading it` and is not affected.

## 4. Cases and checks

- R1 to R8 against the rules file's rule 1 (a defect in text is fixed by reading, the report quotes the text before and after) and rule 17: consistent. Each is a reading of a named place before and after.
- R8's counts, read from `sed -n 93,126p skills/refute/SKILL.md`: Spec bullets at 94 to 103 (ten), Proof at 105 to 114 (ten), Standards at 116 to 124 (nine). After item 8: eleven, ten, ten. The counts are right, and each list still ends with a period on its last bullet.
- R9 against rule 14 and rule 19: see finding 3.
- "Verify" 1 against "Commands and their filters": consistent. "Verify" 2, 4, 6: facts a command computes. "Verify" 5 and 7: readings. Consistent with "Scripts compute facts; judgment is read".
- "Verify" 2, that `grep -c -F` is asked only of single lines: each bullet, numbered item, paragraph and heading of items 1 to 6 is one line, and item 2's three parts are grepped one by one. No multi-line text is asked for. The first new sentence of item 7 ("...beside the test's name.") is not a substring of the old one ("...name and names no revert."), so its count is 0 before and 1 after.
- "Verify" 3, simulated: a script applied item 7's three replacements to copies of the two files and compared `diff -U3` of each against its original. The two diffs are not equal.
- "Verify" 4 on the unchanged tree: `LC_ALL=C grep -n '[^ -~]'` over the six files prints nothing, exit 1. The same over the brief prints nothing, exit 1, so every dictated text is ASCII.
- "Verify" 5 on the unchanged tree prints `skills/spec/templates/brief-check.md:43`, `skills/spec/SKILL.md:50` and `:245`, each `docs/adr`. After the change it also prints the new lines that hold "glossary"; none names a page of one repository.
- "Verify" 6 on the unchanged tree prints the four rule 13 lines; after item 7 it prints nothing.

Findings:

1. "Verify" 3, "`git diff` of the two change standards is identical apart from the file names", cannot hold. The context lines after rule 13 differ between the two files: rule 14 reads "grep it across `skills/`, `utils/`, `docs/` and `README.md`" in `docs/dev/change-standard.md:45` and "grep it across <the source tree, the tests, the examples and `docs/`>" in the template copy, and rule 15 reads "For a script" against "For code" (`diff <(sed -n '36,47p' ...) <(sed -n '36,47p' ...)`). The `index` line of each diff differs as well. A check that holds: "`git diff -U0` of each of the two change standards shows the same three removed and three added lines".
2. "Verify" 2 gives the command as `grep -c -F -- '<the text>' <file>`. Every dictated text but the heading holds an apostrophe ("brief's", "cases'", "test's"), so the text cannot stand between single quotes as written. The check should say how the text is passed, for example "the text written to a one-line file and passed as `grep -c -F -f <that file> <file>`".
3. R9's greps ("brief check", "first run", "DONE / NOT DONE", "verbatim", "revert", "taken out of the code") reach none of the sentences of section 1, finding 1: none of those six patterns matches "changes nothing", "without changing anything" or "An edit to any file". R9 should add that grep, once the wording of finding 1 is settled.
4. The brief's "Report" does not ask for the list rule 14 requires ("A sentence about the changed file as a whole ... is reread against the file after the change, and the report lists each one with the line that shows it still holds"). The sentences of that kind here are `skills/spec/SKILL.md:247`, the introduction of `skills/spec/templates/brief-check.md:3`, and `skills/refute/SKILL.md:3` and `:10`. R2 covers the first only. The rules file binds the builder without the brief, so this is a gap in the brief's report shape, not a contradiction.

## 5. The question

- R1: no. The bullet is read in its place and compared with item 1's text.
- R2: no. The section is read in its place, and the order of eight checks and eight headings is compared.
- R3: no. The `difflib` result of section 2 is what a reader finds: two insertions.
- R4: yes, in one respect. It checks the paragraph "in its place", and the place lets a builder read the change as part of the first task, before the step's code exists (section 8, finding 5).
- R5: no.
- R6: no. Each part of the old paragraph is in the new list: `str.count` of the five kept parts prints 1 in line 67 on main and at least 1 in the brief.
- R7: no for the three sentences. `git grep 'names no revert'` prints nothing only after the change.
- R8: no for counts and places. Yes for the goal on kind 5: the Proof bullet as changed contradicts three sentences of the same file (section 1, finding 1), and R8 reads only "The four headings".
- R9: yes. Section 4, finding 3.
- The check on the step's line ("each changed text read in place, and `grep -c -F` of each new sentence"): no. "Verify" 2 greps each text whole, which fails on any changed word, and the R cases read the place.
- Item 1: no. Kind 1's two halves (breaks a standard, is false) each have a sentence.
- Item 2: no.
- Item 3: no. The unreadable input and the output closed early are both named, with the exit status and the error line (kind 6).
- Item 4 with items 6 (part 4), 7 and 8: no for the builder's side. A test that stays green under the change has no failing line for the table, and `refute`'s new Spec bullet makes a missing change a finding. Neither text says what the builder does when the test stays green; the rule that it is "an audit, not a proof" is in rule 13's fourth bullet, which is enough.
- Item 5: yes, in a repository whose standards state no rule on lists or sentence length; there it asks nothing. In this repository no. The text is ruled.
- Item 6, part 3 and part 5: no.
- Item 6, part 6, with item 8's Standards bullet: yes, in one respect. The report may say of a term that its use is not "in a sense its entry gives" and leave it; the new Standards bullet covers only what "the report's terms part does not name", so a named misuse is a finding only under the general bullet "a documented standard the diff breaks". The text is ruled.
- Item 7: no, apart from section 1, finding 1.
- Item 8: as R8.
- "Verify" 1, 2, 4, 5, 6, 7: no. "Verify" 3: it cannot pass at all (section 4, finding 1).

Findings:

1. R9 can pass while the step leaves the sentences of section 1, finding 1 in contradiction with the new rule 13 and the new Proof bullet.
2. R4 can pass with the paragraph in a place that misleads the builder about when the change is made (section 8, finding 5).

## 6. Implied inputs

- This is a text step. The six files the step writes besides its report are Markdown pages (`wc -l` listed them: two `SKILL.md`, two templates, two copies of the rules file). No script reads their content: `git grep -n 'change-standard\|brief-check\.md\|brief\.md' -- '*.py' '*.sh'` prints only two lines of `check_config.test.sh` that create an empty file of that name. The brief says "This is a text step: nothing in it is a script, and it has no test", which matches.

Findings: none

## 7. ADRs

- `ls docs/adr` prints `README.md` and `template.md`; `ls docs/adr | grep -E '^[0-9]{4}-'` prints nothing, exit 1. No record. The brief's "No ADR touches this step" and "No ADR record exists" match. The index table of `docs/adr/README.md` has no row.

Findings: none

## 8. Dictated text

Read: every text of items 1 to 8 against the prose standard (sections 0, B, D, E), `docs/dev/skill-layout.md` ("Sections, in order", "Where a rule goes", "Lists and tables", "Writing for an agent"), the glossary, and rules 14 and 17 of the rules file.

- Placement by "Sections, in order" and "Where a rule goes": item 1 is a rule for one point of the work and sits in that step's item; the list's closing bullet "The checks are done when ..." stays last, so the item still ends on its completion criterion. Item 8's bullets sit under the heading each belongs to. No new `##` heading enters a `SKILL.md`.
- Glossary senses: "brief", "rules file", "standards" (the first sense, "the reviewer holds a diff to"), "premise", "first run", "case", "orchestrator", "ruling" (its second sense), "state file", "open items", "builder", "reviewer", "finding" are used as their entries give them, apart from finding 3. "Dictated text" has no entry (Decision 6), as "Names" and "Implied inputs" have none. "Terms part" in item 8 names part 6 of the new "Report" list, which the opening line calls a part.
- Rule 17: item 6 keeps every part of the old paragraph (section 5, R6); the changes of meaning in parts 3 and 5 and in rule 13 are the ones the ruling asks for. Rule 13's fifth bullet keeps its last sentence ("The table covers those behaviours, not every branch ...").
- Claims the texts make about the tree: item 6 part 4's "the table the rules file's rule on tests asks for" is borne out by rule 13's fifth bullet ("the report lists them in a table"); rule 7's table is a rule on the report, so the reference has one reading. Item 1's "as the reviewer holds a diff to them" is the glossary's **standards** entry. Item 8's "the last bullet's closing period" is line 103. Item 3's "line 19" and item 6's "line 67" are right. Item 1's "three-space indent of its neighbours" is right for lines 239 to 246.
- Words per sentence, counted with `len(text.split())`: item 1, 42, 11, 15; item 2's bullet, 60; item 3, one placeholder of 95 (78 on main); item 4, 36; item 5, 29 and 19; item 6 part 3, 15, 23, 16; part 4, 28; part 5, 36; part 6, 36 and 31; part 7, 34; part 8, 53 (kept from main); item 7's fourth-bullet sentence, 50; item 8's Standards bullet, 27. The prose standard, "E. Sentence shapes", sets "under roughly 20 words unless the mechanism needs more". "Verify" 7 has the builder name each long sentence with its reason and not rewrite it, which is the right handling for ruled words.

Findings:

1. Item 7, the fourth bullet's new sentence, and item 8's Proof bullet: "a change of its own" contradicts the sentences of section 1, finding 1 (rule 19 of the rules file). Wording in that finding. The rule 13 sentence is ruled, so changing it is the user's call; the Proof bullet is the orchestrator's text (Decision 4).
2. Item 8's Proof bullet, the place of the inserted words: "found by reading it or by a change of the reviewer's own that takes the behaviour out (an assertion over source text, over a label alone, ...)". The parenthesis lists kinds of test and now follows "takes the behaviour out", so it reads as examples of the behaviour (prose standard, "0. Hard rules", plain prose). A wording that would hold: "a test that would still pass with the behaviour it is written for taken out of the code (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs), found by reading it or by a change of the reviewer's own, made on a scratch copy, that takes the behaviour out." Not ruled text.
3. Item 3, "and for a script the case where the program reading its output closes it before the script ends": "case" is used for a situation inside the bullet that lists the inputs which become cases; the brief's own "Conventions" says "case" is used only in its glossary sense, and `docs/dev/skill-layout.md`, "Writing for an agent", says the same of a glossary term. The item is also listed among "each input the step's text implies", and a closed output is not an input. A wording that would hold: "and for a script its output closed by the program reading it before the script ends". The text is ruled.
4. Item 1: the bullet holds two requirements that can each be broken while the other holds (a text read against the rules file and the standards; a claim about the tree checked), joined by a further sentence, against `docs/dev/skill-layout.md`, "Lists and tables", first bullet. The file's form for this is a sub-bullet, as lines 230 to 237 use: the first two sentences as the bullet, and "Each claim a dictated text makes about the tree is checked as a premise is." as a sub-bullet under it. Its neighbour **ADRs** has the same three-sentence form on main. The text is ruled.
5. Item 4's place. The paragraph stands between "The builder's first task, before any change, is the first run of every case ..." and "When the first run finds a case the brief's own rules get wrong, the builder stops there, before changing any code". In that place it parts two paragraphs about the first run, and a builder reads the change to the code under test as part of the first task, before the step's code and tests exist. The sentence gives no time of its own. A place that would hold: after the paragraph "When the first run finds a case ...", or the sentence opened with "After the change,". The sentence is ruled; its place is the brief's choice (section 2, finding 1).
6. Item 6, part 4: "gives that change" has no antecedent in "Report"; "that change" is the change of the "Cases" paragraph, 40 lines above (prose standard, "E. Sentence shapes", cold opens). A wording that would hold: "For each case of a code step, the table the rules file's rule on tests asks for gives the small change "Cases" asks for and the test's failing line with it made." The text is ruled.
7. Item 6, part 5: "the checks above" meant the section "Verify before you report" while the text was a paragraph; as item 5 of a numbered list it can be read as the parts above it in the list. A wording that would hold: "with the checks of "Verify before you report" and their output verbatim". The words are ruled; the list form that makes them ambiguous is Decision 1.
8. Item 6, part 7 holds four parts of the report in one item (files with line counts, judgment calls, visible changes, what was wrong in the brief), while the opening line says the list gives the parts in order, and the prose standard, "D. Structure", turns three or more list-shaped items into a list. The brief's own "Report" section asks for "a section "Judgment calls"", which the template does not. Wording: four items, 7 to 10, with "Doc text" as 11. Not ruled text (Decision 1).
9. Item 2's bullet: 60 words in one sentence holding two checks joined by "; and", and "whether the output bears it out" is a second wording for what section 3 of the same template calls "whether that matches what the brief says" (prose standard, "D. Structure", no synonym cycling). A wording that would hold, as two bullets: "- <each text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints)>: consistent with the rules file and the standards, or the rule it breaks, named with its file and section. Or: no text given word for word." and "- <each claim a dictated text makes about the tree>: `<its command>`, what it printed now, and whether that matches the claim. Or: no claim." with the Findings line as "... each claim of a dictated text that differs from the command's output, with both". Not ruled text (Decision 2).
10. Item 7, the fourth bullet's new sentence: 50 words in two clauses joined by a semicolon, and "the report's table" names a table the rule introduces one bullet later. The fifth bullet as changed (Decision 3) then states the same two columns again. A wording that would hold for the fourth bullet: "The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour and quoting the test's failing line, in the table the next bullet gives. The reviewer checks it by reading the test and by a change of its own on a scratch copy." The text is ruled.
11. Item 8's Standards bullet: the qualifier "that the report's terms part does not name" leaves out a term the report names and misjudges, or names as used outside its sense and leaves (section 5, item 6 part 6). A wording that would hold: "a term of the glossary the diff uses outside its entry's sense, or an entry the diff makes false, whether or not the report's terms part names it;". The text is ruled.

## Declined to judge

- Whether the reviewer may change code at all, and where. The ruled rule 13 sentence says "by a change of its own"; whether that means a scratch copy, and whether `refute`'s "changes nothing" sentences are reworded or the ruled sentence is, is the user's call. Section 1, finding 1 gives the lines.
- Whether each finding of section 8 on a ruled text (findings 1 for rule 13, 3, 4, 6, 7, 10, 11) is worth a change. The texts are ruled, so changing them is the user's call.
- Whether the skills' `metadata.version` rises for `spec` (1.7.0) and `refute` (1.7.1). The brief says nothing; the plan's ruling "Step 3, the brief's choices" (2) took "no skill version changes" for step 3 since the repository sets no rule. A read does not settle it for this step.
- Whether "Dictated text" needs a glossary entry. Decision 6 takes it; `docs/dev/skill-layout.md`, "Writing for an agent", asks for an entry for a term used in a sense of its own, and the other check labels have none. It is the orchestrator's decision as booked.
- `sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md` was not run: it runs the test suites, which create scratch folders, and this check writes nothing outside its own scratch folder. Only the count of its commands (11) was checked.
- The brief's paths were not compared with the briefs of steps in flight. `.scratch/2-g-git-guard/agents/briefs/2b.md` appeared during this run and was not read; nothing under `.agents/worktrees/` was read.
- The earlier brief check's findings (`.scratch/2-h-session-retro/agents/reviews/3a-brief-check.md`) were each read against the new brief and option (a). Each is answered: section 1 findings 1 and 2 by items 7 and 8; 3 asked no change; 4 by Decision 5 and R9; section 2 findings 1 and 5 by the corrected step line and ruling line in `plan.md`, 2 to 4 by the ruling on option (a); section 3's two findings by the ruled kind 3 text ("when the repository has a glossary") and the removal of the old premise; section 4 findings 1 to 5 by items 7 and 3, the new "Verify" 3, the sentence after item 8 that cites rule 4, and the ruled kind 2 text; section 5 findings 1 to 8 and section 8 findings 1 to 8 by the ruled texts, Decision 1 and "Verify" 2. Its point that a first-run sentence should keep "with its result on the unchanged tree" is answered by the ruled words "or the reading and what it found on the unchanged tree"; whether those words also bind the command's output to the unchanged tree is a reading I leave to the user, since the glossary's **case** entry defines the first run as the run on the unchanged tree.

Agent usage: claude-opus-5-5 (ordo-high), 195649 tokens, 27 tool uses, 7.0 minutes ($1.33 to $4.98).

## Closed (the session's change to the brief for every finding of the check on main at 6f40399, made before the preparation commit)

- Section 1 finding 1 and section 8 finding 1 (the reviewer's own change against "changes nothing"): the Proof bullet of item 8 says the change is made on a scratch copy outside the worktree and the main checkout, item 8 changes the first cell of the "Anti-patterns" row, a premise bullet lists the six places, and case R9 gains their grep. The ruled rule 13 sentence is unchanged; its rewording is part 1 of the open item "Step 3a, six ruled sentences the brief check would reword".
- Section 2 finding 1, section 5 finding 2 and section 8 finding 5 (the place of item 4's paragraph): the paragraph stands last in "Cases"; item 4, case R4 and Decision 8 say so.
- Section 2 finding 2: Decision 1 names the words added to the opening line.
- Section 3 finding 1: the premise bullet names `docs/roadmap.md:228` as an unrelated hit.
- Section 4 finding 1: "Verify" 3 compares `git diff -U0` of each change standard.
- Section 4 finding 2: "Verify" 2 passes each text in a one-line file with `grep -c -F -f`.
- Section 4 finding 3 and section 5 finding 1: case R9 gains the grep of the "changes nothing" sentences.
- Section 4 finding 4: "Report" asks for the sentences about each changed file as a whole, as rule 14 asks.
- Section 8 finding 2: the Proof bullet is dictated whole, the parenthesis after "taken out of the code".
- Section 8 finding 8: the old sentence that held four parts becomes parts 7 to 10, and "Doc text" part 11.
- Section 8 finding 9: section "8. Dictated text" has two bullets and the Findings line in the proposed words; Decision 9.
- Section 8 findings 3, 4, 6, 7, 10 and 11 (ruled texts): not changed in the brief; raised as the open item "Step 3a, six ruled sentences the brief check would reword", parts 2, 3, 4, 5, 1 and 6 in that order.
- Declined to judge, the skills' versions: Decision 10, no version changes.

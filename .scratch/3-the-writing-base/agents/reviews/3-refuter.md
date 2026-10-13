# Step 3 refuter report (on .agents/worktrees/3-the-writing-base-3, base aa513eb)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

All commands below were run from the worktree root, /Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-3.

```
$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
exit 0
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "exit $?"
exit 1
Verify 4: `git diff aa513eb` read whole (the brief names `git diff e00f6bd -- skills/writing`; see "Declined to judge").
Verify 5: each added sentence and list item read against the prose standard, section E, and docs/dev/skill-layout.md, "Lists and tables"; result under Proof 1 and Standards 1 and 2.
```

```
$ git status --short
 M skills/writing/SKILL.md
 M skills/writing/references/rules.md
?? .scratch/3-the-writing-base/agents/briefs/3-cases.md
?? .scratch/3-the-writing-base/agents/reviews/3-report.md
$ git diff aa513eb --numstat
46<tab>9<tab>skills/writing/SKILL.md
17<tab>5<tab>skills/writing/references/rules.md
$ wc -l skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md
     176 skills/writing/SKILL.md
     202 skills/writing/references/rules.md
      52 skills/writing/references/registers.md
     430 total
$ grep -n -i -E 'rc\.1|step [0-9]|plan 3|finding [0-9]|manuscript [0-9]|grant [0-9]' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "exit $?"
exit 1
$ LC_ALL=C grep -n '[^ -~]' skills/writing/SKILL.md skills/writing/references/rules.md .scratch/3-the-writing-base/agents/reviews/3-report.md; echo "exit $?"
exit 1
$ for f in skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; do printf '%s ' $f; git show aa513eb:$f | wc -l; done
skills/writing/SKILL.md      139
skills/writing/references/rules.md      190
skills/writing/references/registers.md       52
$ git show aa513eb:skills/writing/SKILL.md | sed -n 5p
  version: "1.0.0"
$ diff <main checkout>/.scratch/3-the-writing-base/agents/reviews/3-report.md <worktree>/.scratch/3-the-writing-base/agents/reviews/3-report.md && echo same
same
$ grep -rn -i convergence --include='*.tex' .   (run in research-hub's projects/manuscripts/hccnet-revision/manuscript/, the source step 2's landing found equal to the copy; the copy itself is not on disk)
printed three lines, at sections/appendix/a_implementation/3_hyperparams.tex:3, sections/3_methodology/c_variants.tex:10 (the claim's own line) and sections/4_experiments/b_implementation.tex:7
```

The report's three checks and their results match the rerun: no output and exit 0, the `ok:` line and exit 0, no output and exit 1. Its file counts, `git status --short` listing and name grep match.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated, Spec 3. `SKILL.md`, "A finding", carries every requirement of kind 1 as ruling 1 amends it (keeps every claim and clause; scope and strength; no number the draft does not give; relation or limit held in the draft's data; computed numbers in brackets; reads as a sentence; vague qualifier). But the scope-and-strength sentence turns ruling 1's open "such as" list into a closed one.
- 2: violated, Spec 1. Every scope sentence is in place except one: "Terms defined at first use" does not state "a technical term only". The prompt's "What you report" carries the two prompt sentences, and the remaining sections ("Evidence for claims", "Clear antecedents", "Most specific term", "Hedging", "Paragraph point", "Reader's question per section") carry theirs.
- 3: holds. `rules.md`, "Terms defined at first use", has the whole-draft first use with the `.tex` and `.docx` reading, "The replacement introduces no term before the place the draft defines it.", and "A replacement that removes or renames a term gives a finding, or a place with its replacement, for every use of it."
- 4: holds. `SKILL.md`, "A finding", has the three "delete" and rewrite bullets in the words of the cases ruling 2. See Standards 4 for how they read against the kind 1 bullet.
- 5: holds. `SKILL.md`, "A finding", has the place bullets, the place check, the addition form (widened by cases ruling 3), the paragraph, list and line-break forms, the several-names and tense bullet, the never-an-instruction sentence and the count bullet. See Standards 3 on the split bullet.
- 6: holds. `SKILL.md`, "A finding", last bullet and its two sub-bullets.
- 7: holds. `SKILL.md`, "How you group them", three bullets.
- 8: holds. `SKILL.md`, "What you read", the file-reading bullet; "What you run", the grep bullet, the `.docx` pipe bullet and the no-redirect bullet.
- 9: holds. `SKILL.md`, Steps 3 "The session holds the list in its own message and writes it to no file." and Steps 5 "The session writes the prompt and the paths in the start call itself and writes them to no file." See Spec 2 on what the move removed from Steps 7.

Cases of the brief's "Cases":

- C1: met. Each of the 27 replacements was read against the markers' reasons in `2-marks.md` and breaks a new sentence of `SKILL.md`, "A finding":
  - manuscript 12, 15, 16, 23, 54, 56, 88, 94 and grant 45, 62 break "keeps every claim and clause";
  - manuscript 17, 46 and 84 break the computed-number sentence;
  - manuscript 20 and 25 break the draft's-own-data sentence;
  - manuscript 45, 68 and 113 break the scope-and-strength sentence;
  - manuscript 59 breaks "reads as a sentence there";
  - manuscript 82 breaks the vague-qualifier sentence;
  - manuscript 2, 3, 4, 19, 21, 29 and grant 41 break the sentences the report's table names.
- C2: partial. Missing: grant 8 and 9, Spec 1. Every other finding of kind 2's lists is put outside its rule:
  - manuscript 1, 2, 3, 4 and 13 by "Evidence for claims" bullets 2 to 4;
  - manuscript 28 and 34 by the value and selection-rule bullet;
  - manuscript 29 by the criterion bullet;
  - grant 41, 42 and 43 by "Clear antecedents";
  - manuscript 52 and grant 33 by "Most specific term";
  - manuscript 21 by "Hedging";
  - manuscript 49 by "Paragraph point" and "Reader's question per section";
  - manuscript 92 by the prompt's section A sentence.
- C3: met. Grant 1 and 5 (first use at paragraph 31, per both markers) break the whole-draft first-use sentence. Grant 4 breaks the every-use sentence and "introduces no term before the place the draft defines it" ("detection limit" at 35). Grant 12 breaks the every-use sentence.
- C4: met. Manuscript 1's rule ("Evidence for claims") says to add evidence and does not cut. Manuscript 119 and 120 (section 0 says to rewrite a dash) and grant 37 ("is rewritten once noticed") fall under "Where the rule says to rewrite, the replacement is the rewritten text, in a comment too." Manuscript 61 stands under the second "delete" bullet, as ruling 2 says.
- C5: met. Each failure was read against the sentence the report names. What the old text lacked and the new text adds: a further place and a description as a place; the check of the place; the addition form; the structure forms; per-place replacements for several names and tense; text in place of instruction; counting before stating.
- C6: met. Grant 37 and 38 against 35 and 17 break "Findings on one passage, or on two places of one claim, propose changes that can all be applied together."
- C7: met. The eight groups with no line break "Every group heading is followed by one line." The nine whose line restates or describes break the two bullets after it.
- C8: met.
  - Commands 1 to 3 break the file-reading bullet and "The one command".
  - Command 4 breaks "You redirect none of it to a file".
  - Commands 5 and 6 break "The one command ... You run it once for each file" by their other greps and counts and by their folder scope.
- C9: met. `3-2-run/manuscript-files.txt` breaks the Steps 3 sentence, and the three prompt files break the Steps 5 sentence.
- C10: met, by reading the changed text against each finding's row in `2-marks.md` and the report's "C10 after the change". Grant 16 and 18 stand under ruling 1, manuscript 61 under ruling 2 and grant 44 under ruling 3. The facts this reading takes from the draft copies (first-use paragraphs, sentence counts) were not reproduced; see "Declined to judge".

## 1. Spec

- 1. `skills/writing/references/rules.md`, "Terms defined at first use": "- A defined term whose value, selection rule or holder is missing is not reported under this section."
  - What is wrong: kind 2 of the brief asks the section to say, in its own words, "a technical term only", then the value/selection-rule/person bullet and the criterion bullet. The diff adds the last two and no sentence that limits the section to a technical term. The report's first run argues that the old "A technical term is defined where it first appears" already excludes a role word. But step 2's agent reported grant 8 ("the analyst") and grant 9 ("data steward") under those same words, and both markers' first reason is that each is a plain role word, not a technical term. The diff also writes "holder" where the brief writes "person".
  - Failure scenario: on a grant that says "The analyst receives only studies taken before diagnosis", the review agent still reports "analyst" as a term never defined. It can, because "A defined term ... holder is missing" applies only to a term the agent takes as defined, and nothing tells it that a plain role word is outside the section. A reader of "holder" also has to guess that it means the person who fills a role.
  - Verdict: item 2 violated; C2 partial (grant 8, 9).
- 2. `skills/writing/SKILL.md:86`, Steps 7: "-   - The session writes no file and adds no finding of its own." became "+   - The session adds no finding of its own."
  - What is wrong: kind 9's title is "The session writes nothing during a run". Its text asks for the two sentences at Steps 3 and 5. The diff also deletes the no-file rule from Steps 7. In step 1 this sentence was made the skill's only statement of the session's no-file rule (`1-refuter.md`, Closed, St1: "the no-file rule is Steps 7"). After the diff, nothing at Steps 4, 6 or 7 says the session writes no file; only the introduction's "It leaves behind nothing" remains, and that sentence stood in step 2 as well. The brief's word "places" allows a move. But the change standard's rule 17 keeps the scope of a rule that is moved, and the old sentence's scope covered Steps 7.
  - Failure scenario: at Steps 7 the session saves the agent's final message to a scratch file to show it. Or at Steps 6 it writes the `claude --version` output to a file. No sentence of the changed skill forbids either, which is the class of write kind 9 exists to end.
  - Verdict: none; item 9's two sentences hold.
- 3. `skills/writing/SKILL.md:124`, "A finding": "It changes no claim's scope or strength beyond the change the named rule asks of it. Such changes are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"."
  - What is wrong: cases ruling 1 gives the two as examples ("such as the device of the right strength under "Hedging" or the limit under ..."). "Such changes are" makes them the whole list.
  - Failure scenario: a draft says "shows excellent predictive capability". Under the prose standard, section 0 (no grandiose self-assessment), the replacement cuts "excellent", which weakens the claim's strength. Or a vague qualifier is replaced with the draft's number, as section A asks. Either is a change the named rule asks, but neither is in the closed list. An agent reading line 124 literally then drops the finding, or keeps the self-assessment in its replacement.
  - Verdict: item 1 violated.
- 4. `.scratch/3-the-writing-base/agents/reviews/3-report.md`, "The checks as run": "$ printf '%s\0' ... | xargs -0 sh -c '...' sh | xargs -0 perl -CSD -ne '<the character-set check of the verify list>'".
  - What is wrong: the brief's "Report" says the checks are given as printed and "A line shortened with "..." is not verbatim". The rerun reproduces the result (exit 0, no output).
  - Failure scenario: the landing booking copies the line, and a reader cannot tell from the record which command ran.
  - Verdict: none.

## 2. Proof

- 1. `3-report.md`, "DONE / NOT DONE", row "Verify 5, lists and sentence length | DONE | "Departures" below", and "Departures from the lists and sentence-length rules".
  - What is wrong: verify 5 asks that each place the new text departs from the rules on list items and sentence length be named with why it needs its form. The section names four. The rerun reading finds more, none of them named.
    - Sentences over roughly 20 words, by a word count of the added lines with inline code counted as one word:
      - `SKILL.md`: the second "delete" bullet (28 words); "A number you would compute ..." (25); "For a vague qualifier ..." (24); "A finding on a paragraph, a list in paragraph form or a line break ..." (24); "Before you report a place ..." (22); "A count a finding states ..." (22).
      - `rules.md`: "A technical term is defined where it first appears in the whole draft: ..." (28); "Evidence the draft gives in its text, a table or a figure counts, ..." (28); "A number or a claim that the draft's own data contradict ..." (23); "A draft that uses it before it defines it, ..." (23).
    - Places with two rules in one bullet or paragraph, listed under Standards 2.
  - The decision that rests on it: verify 5 is a check the brief says must hold before the report, and the report marks it DONE.
  - Failure scenario: the landing takes the departures list as complete and books a step whose new text holds unexamined over-length sentences and joined rules.
  - Verdict: none.

## 3. Standards

- 1. `skills/writing/references/rules.md:55`, "Evidence for claims": "Evidence the draft gives in its text, a table or a figure counts, cited or not, and a claim that has it is not reported under this section." Also `rules.md:7` (28 words) and `SKILL.md:121, :127, :129, :133`, as Proof 1 lists.
  - What is wrong: prose standard, section E, "Sentence length": under roughly 20 words unless the mechanism needs more. Each of these joins two statements that split cleanly. For example: "Evidence the draft gives in its text, a table or a figure counts, cited or not. A claim that has it is not reported under this section." The report does not name them.
  - Failure scenario: a maintainer holding the skill to its own prose standard finds new over-length sentences in the review's rules, the text `/writing` uses to report the same break in drafts.
  - Verdict: none.
- 2. `skills/writing/SKILL.md:138`, "A finding": "A finding on a term used under several names gives each place with its passage and replacement. A finding on tense gives each sentence with its replacement."
  - Also:
    - `SKILL.md:127` ("A number it gives stands in the draft as the replacement uses it. A number you would compute ... is given in square brackets ...");
    - `rules.md:7` ("... is reported, and the finding names the term's first use");
    - `rules.md:115`, "Reader's question per section", whose paragraph now holds three rules ("... is reported. The replacement does what the last column says. A first sentence that states the section's contribution is not reported for being general.").
  - What is wrong: docs/dev/skill-layout.md, "Lists and tables" ("two requirements that can each be broken while the other holds ... are two bullets"), and its Anti-patterns row "A paragraph holding several rules". In each place, one requirement can be broken while the other holds. For example, rules.md:7's report-it and name-the-first-use are the pair grant 1 and 5 broke one of. "Paragraph point" got its new rule as a bullet, but "Reader's question per section" got it folded into the paragraph.
  - Failure scenario: a reviewer of a later change, or the review agent, reads rules.md:115's paragraph as the section's report rule and misses that it also exempts a general first sentence.
  - Verdict: none.
- 3. `skills/writing/SKILL.md:135`, "A finding": "Each part a split leaves holds roughly four sentences or fewer and one idea, or the finding gives a further split."
  - What is wrong: this restates the prose standard, section D ("Paragraphs cover one idea and stay under roughly four sentences"). Three texts forbid that:
    - the brief's "What is on the tree", ADR 0001 bullet: "no fix copies a rule of the prose standard into `skills/writing/`; a fix that needs one names the prose standard's section";
    - the brief's Conventions: "a rule of the prose standard is named by its section, never restated";
    - the skill's own Rules: "This skill's pages hold no copy of the prose standard".
  - The brief's Decision 1 holds the same words. A sentence that names section D satisfies both, such as "Each part a split leaves is within the prose standard, section D, or the finding gives a further split." The bullet at :123 ("It ends the break") already requires the same of a split.
  - Failure scenario: a repository whose `standards` names its own prose page with a different paragraph limit gets the hard-coded "four sentences" from `/writing`. The review agent then holds a split to a limit the repository's page does not set.
  - Verdict: none.
- 4. `skills/writing/SKILL.md:123`, "A finding": "It ends the break and keeps every claim and clause of the passage." against `SKILL.md:120`: ""delete" is the replacement where the named rule says to cut or delete the passage."
  - The rules that cut are `rules.md`, "Clarity test" ("A paragraph whose removal loses nothing is reported. The replacement deletes it.") and "Wordiness" ("it is important to note that | deleted").
  - What is wrong: change standard rule 19, no two statements that contradict each other. A deleted paragraph drops its claims, and a deleted opener drops a clause, so a cut the rule asks for breaks :123 as written. Cases ruling 1 qualified the scope-and-strength sentence with "beyond the change the named rule asks of it". The claim-and-clause sentence has no such qualifier. Both sentences come from the brief (kind 1 "drops no claim or clause", kind 4 "delete").
  - Failure scenario: the review agent meets a paragraph the clarity test reports. :123 forbids dropping its claims and :120 says to delete it. The agent either leaves the finding out or proposes a rewrite the clarity test does not ask for.
  - Verdict: none.
- 5. `skills/writing/SKILL.md:129`, "A finding": "For a vague qualifier it keeps a usual case usual, and never cuts the qualifier so that the case reads as a universal one."
  - What is wrong: docs/dev/skill-layout.md, "Writing for an agent": a term `docs/glossary.md` defines is used only in a sense it defines there. **case** is defined: a brief's case, a diagnosis case, a case of a skill's description. Here it means a state of affairs the claim describes. The report's "Terms" part, which the brief asks to cover each glossary term the diff uses in a new place, does not list it.
  - Failure scenario: a maintainer who greps the skills for "case" in its plan sense finds a use it does not match. The plain wording "keeps a statement of what usually holds as a usual one" avoids the term.
  - Verdict: none.

## 4. Behaviour

- 1. `3-report.md`, "Host- or user-visible changes", third bullet: "`rules.md`: new scope bullets under "Terms defined at first use", "Most specific term", "Clear antecedents", "Hedging", "Evidence for claims", "Paragraph point" and "Reader's question per section"."
  - What a user sees change: `/writing` no longer reports seven kinds of passage it reported before:
    - a claim with evidence in the draft's own tables or text;
    - a defined term with a missing value or selection rule;
    - a determiner with its noun;
    - a word that is the right term;
    - a missing threshold under "Most specific term";
    - a hedge of the right strength on an interpretation;
    - a general first sentence that states the point.
  - A number or claim the draft's own data contradict is now reported under no rule at all (`rules.md`, "Evidence for claims": "a question of content, which no rule of the review covers"). Before, such a passage reached the user as a finding, as manuscript 4's wrong ratio did. After, it is silent.
  - The report names the sections without the before and after for each.
  - Failure scenario: a user of `/writing` whose draft states "about 0.5x" against its own parameter table gets no finding and reads the clean report as covering it. Nothing in the report or the change record tells them that contradicted numbers are now outside the review.
  - Verdict: none.

## Declined to judge

- Whether `git diff e00f6bd -- skills/writing` equals the `git diff aa513eb` read here, and the brief's premise that no commit since e00f6bd changed `skills/writing/` or `docs/dev/building.md`. Both need a git command other than the three allowed: `git diff e00f6bd aa513eb -- skills/writing docs/dev/building.md` (empty output settles both).
- The draft facts the report's first run and "C10 after the change" rest on: the ASCII grep output on the copies, "background-liver" and "components" first at paragraph 31, "usable study" and "divergence score" first at 35, `b_implementation.tex:1` at 6 sentences split 4 and 2, and grant 44's paragraph 42. The step 2 copies are not on disk at the brief's path: `ls -la` of the scratchpad shows it empty. Reproducing these needs the copies at `<scratchpad>/3-2-run/` and `3-2-grant-paras.txt`, or the read-only originals under research-hub. Only the convergence grep was run, on the research-hub original.
- Whether a draft line longer than the runner's file-reading tool shows in one read leaves part of the line unread under the new "read whole with the runner's file-reading tool". The length check over the research-hub original was refused by the permission system. The check that settles it is a count of the copy's `.tex` lines over 2000 characters.
- Whether the review agent following the changed text reports right findings on the two drafts. That is step 4's rerun and marks, by the plan's step 3 line.
- Whether Standards 3 is a contradiction of ADR 0001 that the brief asked for, and so a rule clash for the user, or a finding the landing fixes by naming section D. That is the orchestrator's call: the brief's Decision 1 holds the words and its ADR 0001 bullet and Conventions forbid them.

Reviewer usage: abfeeaa9da306797f, claude-opus-5-5, 228244 tokens, 40 tool uses, 8.6 minutes.

## Repair round 1, refuted

```
(run from /Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-3, base aa513eb)
$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
exit 0
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "exit $?"
exit 1
$ grep -n -i -E 'rc\.1|step [0-9]|plan 3|finding [0-9]|manuscript [0-9]|grant [0-9]' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "exit $?"
exit 1
$ LC_ALL=C grep -n '[^ -~]' skills/writing/SKILL.md skills/writing/references/rules.md .scratch/3-the-writing-base/agents/reviews/3-report.md .scratch/3-the-writing-base/agents/briefs/3-round-1.md; echo "exit $?"
exit 1
$ git status --short
 M skills/writing/SKILL.md
 M skills/writing/references/rules.md
?? .scratch/3-the-writing-base/agents/briefs/3-cases.md
?? .scratch/3-the-writing-base/agents/briefs/3-round-1.md
?? .scratch/3-the-writing-base/agents/reviews/3-report.md
$ git diff aa513eb --numstat
47<tab>8<tab>skills/writing/SKILL.md
23<tab>5<tab>skills/writing/references/rules.md
$ wc -l skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md
     178 skills/writing/SKILL.md
     208 skills/writing/references/rules.md
      52 skills/writing/references/registers.md
     438 total
$ diff <main checkout>/.scratch/3-the-writing-base/agents/reviews/3-report.md <worktree>/.scratch/3-the-writing-base/agents/reviews/3-report.md && echo same
same
```

The report's four checks and its file counts match the rerun. Its "Files" block (178, 208, 52) and its `git status --short` listing match. Verify 4 (`git diff e00f6bd`) is not run here; see "Declined to judge". I read the delta as `diff -u` of the snapshot's `SKILL.md` and `rules.md` against the worktree's, and read it against `git diff aa513eb`. No path outside `files.txt` changed in the tree. The three untracked ledger files are the cases ruling, the round brief and the report.

### Verdicts

Items of the brief's "What to build", over the whole diff since the base:

- 1: holds. `SKILL.md`, "A finding", carries every requirement of kind 1 as the cases ruling amends it. The scope-and-strength bullet now ends "Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"." That is ruling 3's words as given. Round 1's Spec 3 is closed.
- 2: holds. `rules.md`, "Terms defined at first use", opens with "This section covers technical terms only. A plain word for a role or a thing, such as "the analyst", is not reported under it." That is ruling 1's words as given, and the missing-value bullet reads "the person responsible". The other scope sentences are in place: "Evidence for claims" (three), "Terms" (value and criterion), "Clear antecedents", "Most specific term" (two), "Hedging", "Paragraph point", "Reader's question per section" and the two prompt sentences under "What you report". Round 1's Spec 1 is closed.
- 3: holds. `rules.md`, "Terms defined at first use": the whole-draft first use, the `.tex` and `.docx` reading, "The replacement introduces no term before the place the draft defines it.", and the every-use bullet.
- 4: holds. `SKILL.md`, "A finding", three bullets on "delete" and rewriting, in the cases ruling's words. The claim-and-clause bullet now ends "that the named rule does not cut" (ruling 4), so it no longer contradicts the "delete" bullets.
- 5: holds. `SKILL.md`, "A finding": place forms, every further place, the place check, the addition form, the structure forms, the several-names and tense bullets (now two), the never-an-instruction sentence and the count bullet. See Standards 1 and 2.
- 6: holds. `SKILL.md`, "A finding", the last bullet and its two sub-bullets.
- 7: holds. `SKILL.md`, "How you group them", three bullets.
- 8: holds. `SKILL.md`, "What you read" (the file-reading tool, whole), "What you run" (the one `grep`, the `.docx` pipe, no redirect).
- 9: holds. `SKILL.md` Steps 3 ("The session holds the list in its own message and writes it to no file."), Steps 5 ("The session writes the prompt and the paths in the start call itself and writes them to no file.") and Steps 7, which again reads "The session writes no file and adds no finding of its own." (`git diff aa513eb` shows no change at Steps 7; round 1's Spec 2 is closed.)

Cases of the brief's "Cases", over the whole diff since the base:

- C1: met. Each finding's replacement was read against both markers' reasons in `2-marks.md` and breaks a sentence of "A finding". Findings 12, 15, 16, 23, 54, 56, 88, 94 and grant 45 and 62 break the claim-and-clause bullet. Findings 17, 46 and 84 break the computed-number bullet. Findings 20 and 25 break the draft's-own-data bullet. Findings 45, 68 and 113 break the scope-and-strength bullet. Finding 59 breaks "reads as a sentence there", and 82 breaks the vague-qualifier bullet. Findings 2, 3, 4, 19, 21, 29 and grant 41 break the sentences the report's table names.
- C2: met. Grant 8 and 9 are now outside the section by the "technical terms only" bullet (grant 9 also by the person-responsible bullet). The others are as the first refuter found them: manuscript 1, 2, 3, 4 and 13 by the "Evidence for claims" bullets; 28, 34 and 29 by the value and criterion bullets; grant 41, 42 and 43 by "Clear antecedents"; manuscript 52 and grant 33 by "Most specific term"; 21 by "Hedging"; 49 by "Paragraph point" and "Reader's question per section"; 92 by the section A sentence.
- C3: met. Grant 1 and 5 break the whole-draft first-use bullet. Grant 4 breaks the every-use bullet and "introduces no term before the place the draft defines it". Grant 12 breaks the every-use bullet.
- C4: met. Manuscript 1 (the rule adds evidence), 119 and 120 (section 0 says rewrite), and grant 37 ("is rewritten once noticed") break "Where the rule says to rewrite, the replacement is the rewritten text, in a comment too." Manuscript 61 stands under the second "delete" bullet.
- C5: met. Each failure of kind 5's list breaks the sentence the report's table names (place forms and further places, the place check, the addition form, the structure forms, per-place replacements, text in place of an instruction, counting before stating).
- C6: met. Grant 37 and 38 against 35 and 17 break "Findings on one passage, or on two places of one claim, propose changes that can all be applied together."
- C7: met. The eight groups with no line break "Every group heading is followed by one line." The nine whose line restates or describes break the next two bullets.
- C8: met. Commands 1 to 3 break the file-reading bullet and "The one command". Command 4 breaks "You redirect none of it to a file." Commands 5 and 6 break "The one command ... You run it once for each file" by their counts and their folder scope.
- C9: met. The file list written to a file breaks the Steps 3 sentence, and the three prompt files break the Steps 5 sentence.
- C10: met by reading the changed text against each finding's row in `2-marks.md` and the report's "C10 after the change". Grant 16 and 18 stand under ruling 1, manuscript 61 under ruling 2 and grant 44 under ruling 3. The draft facts it takes from the copies are not reproduced (see "Declined to judge").

Rulings 1 to 10 against the delta and the report:

- 1: closed (words as given, bullet placed first).
- 2: closed (Steps 7 as at the base, Steps 3 and 5 sentences kept).
- 3: closed (words as given).
- 4: closed (words as given).
- 5: closed (words as given; "case" no longer appears in the added lines, checked by grep).
- 6: closed. Every sentence Proof 1 lists is split except the vague-qualifier bullet, which is given by ruling 5 and named under "Departures". I counted every added sentence (inline code as one word) and found 26 words in the vague-qualifier bullet, 22 in the renames-a-term bullet, and 20 or fewer in every other. The report names exactly the same four sentences, with counts one higher than mine. No decision rests on that difference.
- 7: closed (words as given; the bullet now names section D).
- 8: closed for the four places listed (two bullets each; "Reader's question per section" is three bullets above the table). See Standards 2 for places of the same kind that ruling 8 did not list.
- 9: closed (the check is quoted whole, no "...", no placeholder, with `exit 0`).
- 10: partly closed. See Behaviour 1.

No closure removes a check instead of fixing what it guarded. No fix reaches beyond a finding: the bullets split under ruling 6 beyond Proof 1's list (added-text lead, `.docx` pipe, group line, "Most specific term") come from the recount that ruling asks for.

### Findings

#### 1. Spec

- none.

#### 2. Proof

- none.

#### 3. Standards

- 1. `skills/writing/SKILL.md:115`, "A finding": "Before you report a place, check the quoted passage. It stands at that line, or in that paragraph of the command's output."
  - What is wrong: ruling 6 split the sentence "Before you report a place, check that the quoted passage stands at that line, or in that paragraph of the command's output." The first sentence now asks to "check the quoted passage" with nothing to check it against. The second states a fact about the passage. The check, what the agent must verify, is no longer an instruction. Change standard, rule 17 (a rewrite keeps the meaning of every rule it carries). The sentence needed about 22 words and the mechanism is one check. Ruling 6 allows it to stay whole and be named under "Departures".
  - Failure scenario: the review agent reads "It stands at that line" as a description of the passage it has already quoted. It verifies nothing, and reports a place whose passage stands in the paragraph before, as the grant finding on a passage quoted from the wrong paragraph did.
  - Verdict: none (item 5 holds).
- 2. `skills/writing/SKILL.md:135`, `:137` and `:138`, "A finding": "A paragraph split quotes the last sentence before the break and the first sentence after it. Its replacement is the same two sentences with an empty line between them." (also "A list quotes the sentence that holds the items. Its replacement is the list as text, introduced with a colon." and "A hard-wrapped paragraph quotes the end of the first line and the start of the next. "..." stands for the rest. Its replacement is the same words with the line break replaced by a space.")
  - What is wrong: `docs/dev/skill-layout.md`, "Lists and tables": two requirements that can each be broken while the other holds, joined by a second sentence, are two bullets. In each of these, what the finding quotes and what its replacement is can each be broken while the other holds. Ruling 8 listed the places to split and these were not among them. The report's "Departures from the lists and sentence-length rules" names no list-item departure in `SKILL.md`; it names only the `rules.md` "is reported. The replacement is ..." bullets. So Verify 5, which asks each such place be named with why it needs its form, is marked DONE with these three unnamed. The same holds for `SKILL.md:99`, where which command to run and that it runs once for each file are one bullet.
  - Failure scenario: a later edit to the split form changes the replacement and, reading the bullet as one rule, leaves the quote form unchanged. Or the review agent follows the replacement form and quotes the whole paragraph, because the quote requirement is not a bullet of its own.
  - Verdict: none.

#### 4. Behaviour

- 1. `.scratch/3-the-writing-base/agents/reviews/3-report.md`, "Host- or user-visible changes", the "Paragraph point" bullet: ""Paragraph point": before it reported a conclusion's first sentence that states the contribution ("In this work, we presented a framework for longitudinal medical image analysis ..."); after it does not, and the same holds for "Reader's question per section"."
  - What is wrong: ruling 10 asks, for each scope bullet added to `references/rules.md`, what `/writing` reported before and after with one example passage for each. The example is manuscript 49, which step 2 reported under "Reader's question per section" (Conclusion), not under "Paragraph point" (`2-run/manuscript-report.md` line 84: `Rule: rules.md, "Reader's question per section" (Conclusion)`). So the "Paragraph point" bullet has no example of its own and is given another rule's before-state. The "Reader's question per section" bullet has no line of its own.
  - Failure scenario: a user reading the change record believes `/writing` reported first sentences of paragraphs under "Paragraph point" for being general, and that this has stopped. The runs show it did so only under "Reader's question per section".
  - Verdict: none (ruling 10 only partly closed).

### Declined to judge

- Whether `git diff e00f6bd -- skills/writing` is the diff the report says it read whole, and the brief's premise that no commit since e00f6bd changed `skills/writing/` or `docs/dev/building.md`. Both need a git command outside the three allowed. `git diff e00f6bd aa513eb -- skills/writing docs/dev/building.md` printing nothing settles both. I read `git diff aa513eb` whole instead.
- The draft facts the report's first run and "C10 after the change" rest on: the ASCII grep outputs on `main.tex` and on the grant paragraphs, the paragraph where "background-liver", "components" and "readout" first appear, `b_implementation.tex:1` at 6 sentences split 4 and 2, `conclusion.tex:1` at 8 sentences split 3, 3 and 2, and grant 44's paragraph. The step 2 copies are not at the brief's path (the scratchpad holds only `3-table.md`, `mk3.py` and `st.txt`). I read each finding's marks and the step 2 reports instead. The "before" examples of "Host- or user-visible changes" I matched to `2-run/manuscript-report.md` and `2-run/grant-report.md`, and all but the one in Behaviour 1 stand under the rule the report names.
- Whether a draft line longer than the runner's file-reading tool shows in one read leaves part unread under "read whole with the runner's file-reading tool". Counting the copy's `.tex` lines over 2000 characters settles it, and the copy is not on disk.
- Whether the review agent following the changed text reports right findings on the two drafts. That is step 4's rerun and marks.
- Whether "the person responsible" (ruling 1's words, used as given) tells the agent for what the person is responsible. That is the orchestrator's wording, not the builder's.

Reviewer usage: a8a5490e9ef2bc1ad, claude-sonnet-5-5, 210747 tokens, 33 tool uses, 4.1 minutes.

## Closed

- Spec 1, technical terms only and "holder": closed in round 1, `rules.md`, "Terms defined at first use", first bullet and "the person responsible"; the run over round 1 gives item 2 holds and C2 met.
- Spec 2, Steps 7's no-file rule: closed in round 1, Steps 7 reads "The session writes no file and adds no finding of its own."
- Spec 3, the closed list of changes of strength: closed in round 1, "Examples are the device ...".
- Spec 4, the shortened check in the report: closed in round 1, `3-report.md`, "The checks as run", the command whole.
- Proof 1 and Standards 1, sentences over roughly 20 words unnamed: closed in round 1, the sentences split and the rest named under the report's Departures.
- Standards 2, two rules in one bullet at the four places listed: closed in round 1.
- Standards 3, the prose standard's paragraph rule restated: closed in round 1, "meets the prose standard's section D".
- Standards 4, the claim-and-clause sentence against the rules that cut: closed in round 1, "... that the named rule does not cut."
- Standards 5, the glossary term "case": closed in round 1, the vague-qualifier bullet without it.
- Behaviour 1, the before and after of the new scope bullets: closed in round 1 for each bullet but "Paragraph point"; the rest under round 1's Behaviour 1 below.
- Round 1, Standards 1, the place check split from its object: fixed at landing, `SKILL.md`, "A finding", the sentence whole, named under `3-report.md`, Departures.
- Round 1, Standards 2, quote form and replacement form in one bullet: fixed at landing, `SKILL.md`, "A finding", separate bullets for a paragraph split, a list and a hard-wrapped paragraph, and "You run it once for each file." as its own bullet under "What you run".
- Round 1, Behaviour 1, "Paragraph point" given another rule's example: fixed at landing, `3-report.md`, "Host- or user-visible changes", one bullet each for "Paragraph point" and "Reader's question per section".
- Declined to judge, the copies of step 2 not on disk: booked in `plan.md`, step 4's Step 0: step 4 copies the manuscript folder and the grant again from research-hub and checks them with `diff -r` and `cmp` before its runs.

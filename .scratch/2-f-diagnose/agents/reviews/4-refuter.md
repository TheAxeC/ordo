# Step 4 refuter report (on .agents/worktrees/2-f-4, base 8b93c6f)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

Every command was run from /Users/axelfaes/workspace/ordo/.agents/worktrees/2-f-4, except where the base or the ledger is named.

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ git ls-files -coz --exclude-standard -- skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md docs/glossary.md skills/repo-setup/templates/plan-terms.md | xargs -0 perl -CSD -ne '<the verify list's character-set program>'
(no output)
exit 0
$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/diagnose/SKILL.md").read().split("---")[1])["description"]))'
965
exit 0
$ grep -o '^[0-9]*\. ' skills/diagnose/SKILL.md | tr -d '\n'
1. 2. 3. 4. 5. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 24. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 
$ cmp <the same string from git show 8b93c6f:skills/diagnose/SKILL.md> <the string above>
cmp exit 0
$ grep -n 'version:' skills/diagnose/SKILL.md
5:  version: "2.1.0"
$ grep -n 'other input' docs/glossary.md skills/repo-setup/templates/plan-terms.md   (cut to 90 columns)
skills/repo-setup/templates/plan-terms.md:35:- **diagnosis record**: the copy of the `diag
skills/repo-setup/templates/plan-terms.md:66:- **other input**: in a diagnosis, an input o
docs/glossary.md:40:- **diagnosis record**: the copy of the `diagnose` skill's `templates/
docs/glossary.md:71:- **other input**: in a diagnosis, an input other than the reported on
$ grep -n -i 'other input' skills/diagnose/SKILL.md | cut -d: -f1
171 172 173 175 176 181 183 185 192 193 209 211 222 228 231
$ grep -n '^15\. \|^20\. ' skills/diagnose/SKILL.md
166:15. State the cause: ...
232:20. Inside a plan, hand the fix over ...
$ git status --short
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/diagnose/templates/diagnosis.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/2-f-diagnose/agents/reviews/4-report.md
$ git diff 8b93c6f --stat
 docs/glossary.md                          |  3 +-
 skills/diagnose/SKILL.md                  | 51 ++++++++++++++++++++++++++-----
 skills/diagnose/templates/diagnosis.md    | 17 +++++++++--
 skills/repo-setup/templates/plan-terms.md |  3 +-
 4 files changed, 61 insertions(+), 13 deletions(-)
```

The commands the builder's report quotes as evidence, rerun:

```
$ git grep -n -i 'other input\|candidate fix' 8b93c6f -- skills docs README.md
(no output, exit 1)                                       report: printed nothing. Reproduced.
$ sed -n 166,196p <base SKILL.md> | grep -n -i 'operation\|spelling\|link\|alias\|another input\|each input'
(no output, exit 1)                                       report: printed nothing. Reproduced.
$ sed -n 166,196p <base SKILL.md> | grep -n -i 'wait\|reply\|person\|stop'
7 lines, every one about the cause not found              report: seven lines. Reproduced.
$ wc -l (base, then worktree)
318 / 353 skills/diagnose/SKILL.md; 120 / 131 templates/diagnosis.md; 147 / 148 docs/glossary.md; 130 / 131 plan-terms.md   Reproduced.
$ grep -n -i -w 'just\|simply\|easy\|very\|really\|often\|typically\|generally' skills/diagnose/SKILL.md
(no output, exit 1)                                       Reproduced.
$ grep -n '^## ' skills/diagnose/templates/diagnosis.md
7:## Symptom 11:## Where the probes run 22:## Red command 50:## No red command 54:## Shrunk case 62:## Hypotheses 72:## Probes 78:## Cause 82:## Operation and other inputs 92:## Fix and test 125:## Cleanup   Reproduced.
$ grep -n 'diagnosis record' skills/diagnose/SKILL.md
3:, 10:, 64:2. Open the diagnosis record with the symptom quoted in its Symptom section., 338:   Reproduced.
$ sed -n 166,231p skills/diagnose/SKILL.md | grep -n -i probe
"probe" names a hypothesis's probe or "the change of the probe" on every hit; no run of an other input is called a probe.   Reproduced.
$ awk '/^## Open items/{f=1;next} /^## /{f=0} f' .scratch/2-f-diagnose/orchestrator-state.md   (main checkout)
- none                                                    Reproduced. (The report's "sed -n 43,47p" now prints the dispatch block, since the orchestrator rewrote the state file after the build; the content quoted is right.)
$ wc -w per line, the "- " marker removed, every added line of Steps 15 to 19 over 20 words
167 24, 168 22, 169 35, 170 27, 174 32, 177 24, 183 22, 184 29, 186 26, 189 23, 192 32, 209 43, 211 44, 220 25, 222 30, 223 23, 224 32, 225 35, 227 36, 229 39, 230 24, 231 43
base Done lines 63, 123, 165: 24, 54, 35 (wc -w with the marker)   The report's base counts reproduce; its list of long lines does not (finding Proof 1).
$ grep -l -i 'diagnos\|hypothes' docs/adr/0*.md   (main checkout)
(no output, exit 1)
$ grep -n -i 'glossary\|plan-terms\|skill-layout\|metadata.version\|template' over the ADRs that match
0001, 0002 (the prose standard's place), 0004 (the glossary's open item and ruling), 0007, 0010, 0011: none governs diagnose, the record template, the entries diagnosis record or other input, or the version rule.
$ git tag --contains d3a5b27; diagnose's version at v2.9.0, v3.0.0, v4.0.0
v3.0.0 v4.0.0; "1.2.0", "2.0.0", "2.0.0"   The brief's premise that 2.0.0 is released reproduces.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The entry stands after **orchestrator** in both files (glossary:71, plan-terms:66) with "Stated in: `diagnose`, Steps 15 to 19", and the term's hits in the skill run from line 171 to line 231, inside Steps 15 (166) to 19 (ends 231). Standards 4 names the entry's second sentence.
- 2: holds for lines 183, 184, 186, 211 and 224. A run of an other input is called a run, and the change under test is "the change of the probe that shows the cause". Line 174 changes the red command's setup inside Steps 15 (Spec 1).
- 3: holds. Lines 167 to 170 state the operation, its place, the rule it breaks, the restatement of a property of the input, and which hypothesis is the cause when several probes turned the red command green. Line 170 has a gap on the step-3 defect (Behaviour 2).
- 4: holds for lines 172 and 173, which follow the brief's words. Lines 174 and 175 go beyond the item (Spec 1).
- 5: holds. Lines 176 to 182 give the list, the four kinds, the limit to what the code admits, and the reported input left off it.
- 6: holds as the brief words it. Lines 183 to 189 cover the two runs, the record, the three classes and the cost clause. The class definitions the brief dictates give no class to an input whose right result differs from the reported input's (Behaviour 1).
- 7: holds. Line 211 gives one test case each, "whether or not the change of the probe already turned it green". Lines 217 and 220 quote the failure of each test case.
- 8: holds for lines 222 to 227. Line 221, unchanged, now contradicts line 222 (Standards 1).
- 9: violated, Spec 2. Line 231's Done line requires "the test is green" while lines 211 and 225 leave a red test case for an input written as not fixed.
- 10: holds. Lines 190, 223 and 229, and the template's Class column and its "left out, for another defect" cell.
- 11: holds. Lines 191, 192, 215 and 230, and template lines 90 and 121.
- 12: holds. The diff adds no Stops row and no wait. Line 194 is text larger than its job (Standards 3).
- 13: holds. The numbering string is the same as on the base (cmp exit 0). The Done lines of Steps 15 to 19 (209, 216, 220, 227, 231) are changed.
- 14: holds. `5:  version: "2.1.0"`. 2.0.0 is in v3.0.0 and v4.0.0.
- 15: holds. "## Operation and other inputs" stands at template:82, between Cause (78) and Fix and test (92), with the operation line, the six-column table and the "none, with the reason" line.
- 16: holds. Template:80. Its scope is narrower than line 225's (Standards 5).
- 17: holds. Template:97 and :118.
- 18: holds. Glossary:40 and plan-terms:35 read "the cause, the operation with its other inputs and the fix with its test", in the template's order.
- 19: holds, as item 1.
- 20: holds. `ok: the plan-terms block equals the template`.

Cases of the brief's "Cases":

- 1, the step-3 defect: partial. The missing parts are the class of an agents folder not yet made that is not the same folder (Behaviour 1), the choice between hypotheses 1 and 3 (Behaviour 2), and "the third hypothesis kept", which rests on text no item asks for (Spec 1). A run that follows the text gets this far:
  - Line 169 restates "two trailing slashes" at the refusal at `pin.sh:317`.
  - Lines 176 to 181 give `agents/.`, `agents/./`, a link and a folder not yet made.
  - Line 186 classes the first three part of the defect: by the judges' reading of lines 112 and 317 they are red with the reported symptom on the unfixed tree, and red with probe 1's change.
  - Probe 1 leaves `agents/.` red, so line 224 sends the fix once more to the operation.
  - Line 222, with a link on the list, needs a comparison of the folders themselves.
  - Line 211 gives a test case for each input of the defect.
- 2, an other input already green: met. With `$HOME/.claude/./agents/` in place of the reported input, line 112 derives `$HOME/.claude/./agents`, so the unfixed line 317 refuses it and red.sh's four parts pass. Line 187 classes it not part of the defect. Line 211 gives test cases only to inputs part of the defect. Lines 223 and 229 keep its result.
- 3, another defect: met. Line 188 classes it another defect, line 190 writes it in the record with its result and does not fix it, line 223 leaves it as it was, line 229 leaves it out of the result, and the template's Result-after-the-fix cell reads "left out, for another defect".
- 4, an input of the defect still red after the second change: partial, Spec 2. Line 225 and template line 80 write the input as not fixed and say so in the Cause section. Steps 19's Done line can then never be met, because that input's test case (line 211) stays red, and the text says nothing about that test case.
- 5, a defect in text: met. Line 191 names the instruction as the operation. Line 192 reads the other situations against the text before the fix, and line 230 reads them after it. Line 215 asks for no test.
- 6, no person present: met. No Stops row is added and no step waits.
- 7, the numbering: met. cmp exit 0.

## 1. Spec

- Spec 1. skills/diagnose/SKILL.md:174-175: "A probe whose change stops the red command at an input its setup uses, before the reported input is reached, is run again with a setup that does not use that input." / "That input is recorded as an other input."
  - What is wrong: no item asks for this. The brief prescribes a different route: "When the first run finds a case the brief's own rules get wrong, the builder stops there, before changing any text, and hands back the first run and that case." The rules file's "The rules" 4 says "the substitute is the orchestrator's to write, not the builder's."
  - The builder's report says item 4's words "do not describe the recorded third probe" and that "Case 1's 'third hypothesis kept' depends on it" (Judgment calls). That is a case the brief's rules get wrong, so the step should have stopped there. The report instead says "I did not treat it as a wrong rule" and wrote its own rule.
  - The new text has defects of its own:
    - It changes the red command's setup inside Steps 15, which makes a second command. The glossary's **red command** is "the one command of a diagnosis".
    - It does not say whether line 184 and Steps 16 to 19 run the old setup or the new one.
    - It does not record the rerun in the Probes section (Steps 12) or undo it (Steps 13), while line 218 says "every probe's change undone".
    - It runs a probe in Steps 15, outside Steps 11 to 13, which the glossary's **probe** names as where probes run.
  - Failure scenario: a diagnosis agent reruns a probe with the red command's setup changed (folders made in advance) and leaves that change in. It runs the other inputs on the changed setup and the reported input on the old one, then writes Steps 17's failure on a tree that still holds the rerun's change.
  - Verdict: case 1 partial ("the third hypothesis kept" rests on these lines). Item 4 holds for lines 172 and 173.
- Spec 2. skills/diagnose/SKILL.md:231: "Done when the test is green, the red command is green and the original case is green, and each other input gives the result its class requires, each quoted in the record, with an input written as not fixed quoted with its result."
  - What is wrong: line 211 gives each input part of the defect a test case, and line 225 allows such an input to stay "not fixed". That input's test case is then red after the fix, so "the test is green" cannot hold. The exception for a not-fixed input covers the other-input clause only.
  - The brief's case 4 expects the not-fixed input to be recorded and the run to end. The rules file's "The rules" 9 forbids both ways out an agent has left: dropping the test case is a check loosened to pass, and keeping a red case means "A test never asserts a known defect" is broken at the repair round.
  - Failure scenario: a diagnosis agent whose second change leaves `agents/.` red either deletes that test case to reach Done, which narrows the test that line 211 exists to keep wide, or hands a red test to the repair round, whose landing then goes red.
  - Verdict: item 9 violated, case 4 partial.

## 2. Proof

- Proof 1. 4-report.md, "Item 7 of the verify list": "Every changed bullet is one rule ... Bullets over about 20 words, and why each keeps its form:" followed by lines 169, 174, 177, 192, 222, 224, 225 and the "Done lines 209, 227, 229 and 231".
  - What is wrong: verify item 7 requires each departure to be named. My count of the added lines finds 167 (24 words), 168 (22), 170 (27), 183 (22), 184 (29), 186 (26), 189 (23), 211 (44), 220 (25), 223 (23) and 230 (24) unnamed. Line 211, at 44 words, is the longest non-Done bullet. Line 229 is called a Done line, but it is the class bullet of Steps 19.
  - The claim "Every changed bullet is one rule" does not reproduce (Standards 2).
  - Decision resting on it: whether verify item 7 holds.
  - Failure scenario: the orchestrator reads the report as having held every new line to the sentence and list-item rules, and lands bullets the report never checked.
  - Verdict: none on an item. This is a report defect.
- Proof 2. 4-report.md, case readings, 1: "Hypotheses 1 and 2 turned the red command green, so 'the cause is the hypothesis at the operation' (line 170), the comparison of spellings." and "the folder not yet made as not part of the defect (187: green without the fix, not refused unless it is the same folder)".
  - What is wrong:
    - Hypothesis 1 in the step-3 record is "line 317 compares the skill folder with only one trailing slash removed". "The paths compared as text" is hypothesis 3.
    - Line 187 says "Not part of the defect: green on the tree without the fix." It says nothing about "not refused unless it is the same folder"; the reading supplies that.
    - By the judges' reading of lines 112 and 317, an agents folder not yet made spelled as the reported input (`<x>/agents//`) is not refused on the unfixed tree, so it is red there and is part of the defect, not "not part".
  - Decision resting on it: the report's "met" for case 1.
  - Failure scenario: the orchestrator accepts case 1 as met on a reading that attributes to the text what it does not say.
  - Verdict: case 1 partial (with Behaviour 1 and 2).

## 3. Standards

- Standards 1. skills/diagnose/SKILL.md:221 (unchanged) against :222 and :224: "18. Make the fix at the cause, which is the change Steps 13 undid." / "The fix is one change at the operation, ..." / "... the fix is changed once more at the operation."
  - What is wrong: the rules file's "The rules" 14 and 19 (a sentence the change makes false, two statements that contradict each other).
    - When the probe left standing changed something other than the operation, line 221 makes the fix that change and line 222 makes it a change at the operation. On the step-3 defect, probe 2's change was at line 75, the place the folders are read.
    - After line 224's second change, the fix is no longer "the change Steps 13 undid".
  - Line 166, "the hypothesis the probes left standing", still agrees with lines 167 to 172, read as the hypothesis restated at its operation, with line 172 counting a hypothesis as standing. One caveat stands: the Probes row of Steps 12 keeps "falsified" for that hypothesis, and no line says to correct it.
  - Failure scenario: an agent follows Steps 18's first line, applies probe 2's change at `pin.sh:75` as the fix (what the step-3 side did), and line 227's Done line is met.
  - Verdict: none on an item (item 8's own lines hold). It bears on case 1.
- Standards 2. skills/diagnose/SKILL.md:173, 182, 190, 225, 229. For example: "An input still wrong after that second change is written in the record as not fixed, with its result, and the Cause section and the session's final message say the fix does not cover it."
  - What is wrong: docs/dev/skill-layout.md, "Lists and tables", first bullet: "two requirements that can each be broken while the other holds, joined by 'and' ... are two bullets".
    - 173: the input is recorded / the fix handles it.
    - 182: the list holds what the code admits / the reported input is not on it.
    - 190: written in the record / not fixed.
    - 225: written as not fixed / the Cause section and the final message say so.
    - 229: three class requirements.
  - Also: lines 177 and 185 introduce sub-lists with a full stop, where prose-standard D says "Lists are introduced with a colon".
  - Failure scenario: a reviewer checking a later diff, or a run, cannot tell that one half of a bullet was dropped while the other half holds, which is the failure skill-layout's Anti-patterns row "A paragraph holding several rules" names.
  - Verdict: none on an item.
- Standards 3. skills/diagnose/SKILL.md:194 and :189: "This work goes on without a reply, run by a person or with no person present." / "... so its failure costs what the defect's costs."
  - What is wrong:
    - Line 194 restates a default. Steps 15 to 19 hold no wait, and "Rules" says the waits come from "Stops". That breaks skill-layout "Writing for an agent": "A sentence stays only when it changes what the reader does". Its "This work" also has no antecedent (prose-standard E, cold opens).
    - Line 189's "what the defect's costs" does not parse. "What the reported input's failure costs" is meant.
  - Failure scenario: a reader parsing line 189 cannot tell which cost it ties to Steps 16's cost rule.
  - Verdict: none.
- Standards 4. docs/glossary.md:71 and plan-terms.md:66: "Each is run through the red command with that input in place of the reported one, and is put in one of three classes".
  - What is wrong: the skill's line 192 uses the term for a defect in text, where each other input is "read against the text in place of a run". The entry's second sentence, which no item dictates, is then false for that sense. Skill-layout "Writing for an agent": a term is used only in a sense its entry defines.
  - Line 171 also defines the term inside the skill as well as in the glossary ("One meaning has one place"). It is placed before the first use (172) and matches the entry's first sentence word for word in substance, and Steps 4 line 104 sets a precedent for an inline definition. The orchestrator rules whether the duplicate stays.
  - Failure scenario: a reader of the glossary, diagnosing a defect in a skill's text, runs a red command for each situation the instruction governs instead of reading them.
  - Verdict: none.
- Standards 5. skills/diagnose/templates/diagnosis.md:80: "each input of the defect the fix does not cover, or "none"".
  - What is wrong:
    - The class is named "part of the defect" everywhere else. The brief's conventions require the three classes to be "named the same way every time they come back". The brief's item 16 used the same variant.
    - Line 225 makes the Cause section name any input "still wrong after that second change", an input not part of the defect that the fix broke included. Template line 80 asks only for inputs of the defect.
  - Failure scenario: an agent whose fix breaks a green input writes it "not fixed" in the table and leaves it out of the Cause section, because the template asks only for inputs of the defect.
  - Verdict: none.

## 4. Behaviour

- Behaviour 1. skills/diagnose/SKILL.md:186-188 with :183: "For a defect in code, run each other input through the red command, with that input in place of the reported one." / "Not part of the defect: green on the tree without the fix."
  - What is wrong: the red command asserts the reported input's right result. In the step-3 `red.sh`, part 1 checks that the refusal is printed and part 2 that the worktree did not move, and it exits 1 when any part fails.
  - Case 1 needs an other input whose right result is the opposite: a skill folder not yet made with its own agents folder not yet made, two different folders (the pair probe 3 broke), which must not be refused. Put in place of `$a1//`, the correct, unfixed `pin.sh` does not refuse it and moves the worktree, so red.sh exits 1 (parts 1 to 3 red, part 4 absent).
  - It is then red on the tree without the fix without the reported symptom, so no class fits:
    - It is not green, so it is not "not part of the defect".
    - The reported message is absent, so it is not "part of the defect".
    - Its operation is the same, so it is not "another defect".
  - Lines 223 and 229 protect it only once it is classed "not part of the defect". Lines 173 and 175 record it as an other input, but line 183 runs it where the red command expects a refusal.
  - The class definitions are the brief's item 6, word for word, so the substitute ("green" read as the result right for that input, or the run asserting each input's right result) is the orchestrator's to write. The builder's report does not raise it.
  - Answer to the question asked: line 187 classes an agents folder not yet made correctly only in two cases. One is the same folder spelled as line 112 derives it, which the unfixed tree refuses and the red command passes. The other is the same folder spelled like the reported input, which is red with the symptom and so part of the defect. Two different folders not yet made fall outside the three classes, so Steps 18 and 19 do not reliably keep the fix from treating them as equal.
  - Failure scenario: a diagnosis agent reads the red result with the nearest class, "part of the defect", and line 222 then makes the fix "right" for it as the red command defines right: refused. That fix refuses every folder that does not exist yet, the empty-string behaviour of probe 3 that case 1 says the fix must not have.
  - Verdict: case 1 partial.
- Behaviour 2. skills/diagnose/SKILL.md:170: "When more than one probe turned the red command green, the cause is the hypothesis at the operation, and its probe is the one that shows it."
  - What is wrong: on the step-3 defect, once hypothesis 3 is rerun green, hypothesis 1 ("line 317 strips one slash where line 112 strips all") and hypothesis 3 ("the paths compared as text") both sit at `pin.sh:317`, and the line chooses neither.
  - If hypothesis 1 is chosen, the cause is stated at line 317 but in terms of slashes, while case 1 expects it "not at the slashes". Probe 1's change is then the change under test, and the run reaches the folder comparison only through line 224's second change.
  - The wording is the brief's item 3, so the tie-break is the orchestrator's to write.
  - Failure scenario: an agent states the cause as the one-slash strip at line 317, which is the cause judge 1 marked as "one spelling of the problem as the whole problem".
  - Verdict: case 1 partial.
- Behaviour 3. 4-report.md, "Host- or user-visible changes": "/diagnose Steps 15: before, ... after, the same first line, then the cause at the operation, the other inputs listed, run, classed, and written in the record's new section."
  - What is wrong: the rerun of a probe with a changed red-command setup (lines 174 and 175) changes what a run of `/diagnose` does, and this list does not name it. It appears only under the judgment calls.
  - Failure scenario: a user reading the change list does not learn that a diagnosis may now rerun a probe on a changed setup.
  - Verdict: none on an item (Spec 1 holds the substance).

## Declined to judge

- Whether an agents folder not yet made, spelled `<x>/agents//`, ends with the reported "the links do not match the pin after linking" on the unfixed tree. I read it from lines 112 and 317 as the judges quote them, without running `pin.sh`; a run of red.sh with that input on the comparison's input tree (44caaf6 plus the 2.E step-3 round-0 diff) would settle it.
- Whether a diagnosis following the text wins or ties the rerun of the blind comparison. That is the orchestrator's comparison after landing and Axel's call.
- Whether the duplicate definition at line 171 stays (Standards 4). The standard and the skill's own precedent at Steps 4 point different ways, so it is the orchestrator's ruling.
- Whether the version raise to 2.1.0 meets skill-layout's "A plan that changes a skill raises one part of its metadata.version once": plan 2.F raised diagnose to 1.2.0 at fa32d9d before plan 2.1 raised it to 2.0.0 (released). The brief's decision 7 rules this, and I do not reopen it.

Agent usage: a961b9fcb88f8028e, claude-opus-5-5, 186998 tokens, 35 tool uses, 9.0 minutes.

## Repair round 1, refuted

Every command was run from /Users/axelfaes/workspace/ordo/.agents/worktrees/2-f-4 unless the main checkout is named. The worktree diff at the round's start is `4-round-0.diff` (`shasum` 11fc9ca805f4, equal to the dispatch entry). The delta below is `diff 4-round-0.diff <git diff 8b93c6f now>`, read against the whole diff since the base.

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ git ls-files -coz --exclude-standard -- skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md docs/glossary.md skills/repo-setup/templates/plan-terms.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
(no output)
exit 0
$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/diagnose/SKILL.md").read().split("---")[1])["description"]))'
965
exit 0
$ grep -o '^[0-9]*\. ' skills/diagnose/SKILL.md | tr -d '\n'
1. 2. 3. 4. 5. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 24. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 
$ cmp <(git show 8b93c6f:skills/diagnose/SKILL.md | grep -o '^[0-9]*\. ' | tr -d '\n') <(grep -o '^[0-9]*\. ' skills/diagnose/SKILL.md | tr -d '\n')
cmp exit 0
$ grep -n 'version:' skills/diagnose/SKILL.md
5:  version: "2.1.0"
$ grep -n 'other input' docs/glossary.md skills/repo-setup/templates/plan-terms.md   (cut to 110 columns)
docs/glossary.md:40:- **diagnosis record**: the copy of the `diagnose` skill's `templates/diagnosis.md` that a
docs/glossary.md:71:- **other input**: in a diagnosis, an input other than the reported one that reaches the o
skills/repo-setup/templates/plan-terms.md:35:- **diagnosis record**: the copy of the `diagnose` skill's `templ
skills/repo-setup/templates/plan-terms.md:66:- **other input**: in a diagnosis, an input other than the reported one that reaches the o
$ grep -n -i 'other input' skills/diagnose/SKILL.md | cut -d: -f1
172 174 176 180 184 185 188 196 198 213 215 226 230 235 240
$ grep -n '^15\. \|^20\. ' skills/diagnose/SKILL.md   (cut to 80 columns)
166:15. State the cause: the hypothesis the probes left standing, with the probe
241:20. Inside a plan, hand the fix over by where the defect was found.
$ git status --short
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/diagnose/templates/diagnosis.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/2-f-diagnose/agents/reviews/4-report.md
$ git diff 8b93c6f --stat
 docs/glossary.md                          |  3 +-
 skills/diagnose/SKILL.md                  | 62 ++++++++++++++++++++++++++-----
 skills/diagnose/templates/diagnosis.md    | 19 ++++++++--
 skills/repo-setup/templates/plan-terms.md |  3 +-
 4 files changed, 72 insertions(+), 15 deletions(-)
```

The commands the round's report quotes as evidence, rerun, with the comparison:

```
$ sed -n 166,240p skills/diagnose/SKILL.md | grep -n -i 'wait\|reply'
(no output, exit 1)                                   report: printed nothing. Reproduced.
$ grep -n -i -w 'just\|simply\|easy\|very\|really\|often\|typically\|generally' skills/diagnose/SKILL.md
(no output, exit 1)                                   Reproduced.
$ sed -n 166,240p skills/diagnose/SKILL.md | grep -n -i probe
"probe" names a hypothesis's probe or "the change of the probe" on every hit; no run of an other input is called a probe.   Reproduced.
$ double-blank awk over SKILL.md and diagnosis.md
(no output)                                           Reproduced.
$ wc -l (worktree)
362 SKILL.md / 131 diagnosis.md / 148 glossary.md / 131 plan-terms.md   Reproduced (report: 362, 131, 148, 131; 353 before the round matches the first run's count).
$ wc -w per line, the list marker removed, lines over 20 words in 167-240
167 24, 168 22, 169 24, 171 39, 173 31, 175 33, 181 24, 184 24, 185 31, 186 30, 192 27, 213 43, 215 49, 224 25, 226 24, 228 23, 229 33, 231 30, 234 36, 239 24, 240 42 (changed lines of the round or of round 0)   The report's table lists exactly these 21. Reproduced.
$ wc -w template lines 76 80 84 86 88 90 121 / glossary 71 and 40
39 67 38 40 95 38 22 / 101 and 62; the sentence 3 of glossary 71 is 40 words   Reproduced.
$ diff of the five fenced blocks of agents/briefs/4-round-1.md against SKILL.md 167-198, 215, 225-232, 236-240, and against glossary:71 and plan-terms:66
no difference in any of the five (the template edits of item 5 read by eye: Cause placeholder, Probes Result cell, "Right result" column and the three cells match the brief's quoted words)   Applied word for word.
$ awk '/^## Open items/{f=1;next} /^## /{f=0} f' orchestrator-state.md   (main checkout)
- none                                                Reproduced.
$ grep -l -i 'diagnos\|hypothes' docs/adr/0*.md   (main checkout)
(no output, exit 1)                                   No ADR governs the diff; ADR 0010 (verify list) and 0012 (commit paths) concern landing, not the changed text.
$ grep -n '^## ' skills/diagnose/templates/diagnosis.md
7 Symptom, 11 Where the probes run, 22 Red command, 50 No red command, 54 Shrunk case, 62 Hypotheses, 72 Probes, 78 Cause, 82 Operation and other inputs, 92 Fix and test, 125 Cleanup   Reproduced.
```

Commands outside the allowed list that I ran, all read-only: the brief's `git ls-files` (part of check 1), `git show 8b93c6f:skills/diagnose/SKILL.md` for the numbering comparison, `git diff 8b93c6f --stat`, and `git diff 8b93c6f | shasum`. I wrote one file under the scratchpad directory, `now.diff`, for the delta; I changed nothing in the repository or the ledger.

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: holds. The entry stands after **orchestrator** in both files (glossary:71, plan-terms:66, equal by `diff`), with "Stated in: `diagnose`, Steps 15 to 19"; every hit of the term in the skill lies at lines 172 to 240, inside Steps 15 (166) to 19 (ends 240). The entry is the round brief's text, which differs from the brief's item 1 by its sentences 2 and 3.
- 2: violated for its last clause, "the glossary's **red command** stays true" (Standards 1). A run of an other input is called a run and the change under test is "the change of the probe that shows the cause" (lines 186, 215, 225, 229), so those clauses hold.
- 3: holds. Lines 167 to 170 state the operation, its place, the rule and the restatement of a property of the input. Line 171 is the round's wording of the tie-break and does not choose between hypotheses 1 and 3 (Behaviour 1).
- 4: holds. Lines 172 to 175; line 173 covers a probe stopped in its setup.
- 5: holds. Lines 176 to 183.
- 6: holds. Lines 184 to 192; the classes are defined against the right result (lines 189 to 191).
- 7: holds. Line 215 gives one test case each, asserting that input's right result; line 221 and line 224 quote each failure.
- 8: holds as worded; line 230 lets a regression land (Behaviour 2).
- 9: holds. Lines 235 to 240; the exception for an input written as not fixed is in lines 236 and 240.
- 10: holds. Lines 193, 194, 228, 238 and the template's Class column and "left out, for another defect" cell.
- 11: holds. Lines 195 to 197, 219, 239; template lines 90 and 121.
- 12: holds. `grep -i 'wait\|reply'` over 166 to 240 prints nothing and the diff adds no Stops row.
- 13: holds. `cmp exit 0`; the Done lines of Steps 15 to 19 (213, 220, 224, 234, 240) carry the new work.
- 14: holds. `5:  version: "2.1.0"`; `description` is 965.
- 15: holds. `## Operation and other inputs` at template:82, between Cause (78) and Fix and test (92), with the operation line, the seven-column table and the "none, with the reason" line.
- 16: holds. Template:80 states the cause at the operation with place and rule and names "each other input written as not fixed, or "none"".
- 17: holds. Template:97 ("for each test case") and :118 (the red command on each other input).
- 18: holds. glossary:40 and plan-terms:35 name "the operation with its other inputs" in the template's order.
- 19: holds, as item 1.
- 20: holds. `ok: the plan-terms block equals the template`; the two **other input** lines are equal.

Cases of the brief's "Cases":

- Case 1, the step-3 defect: partial (Behaviour 1, Behaviour 2, Behaviour 3). Followed on the step-3 record's hypotheses (1: line 317 strips one slash where line 112 strips all; 2: line 75 keeps the slashes; 3: the paths compared as written, probe 3 stopped at `setup pin v1 failed`): line 167 and 168 give the operation at `pin.sh:317` and its rule; lines 172 to 175 keep hypothesis 3 and give it one more probe; lines 176 to 179 list `agents/.`, `agents/./`, a link and an agents folder not yet made; lines 184 to 191 class `agents/.`, `agents/./`, the link and the same folder not yet made as part of the defect (wrong on the unfixed tree at line 317) and a different folder not yet made as not part of the defect (right on the unfixed tree); line 215 gives a test case to each input of the defect. Two steps do not reach the expected fix reliably: line 171 does not choose between hypotheses 1 and 3, and line 230 lets the empty-string resolution land as "not fixed".
- Case 2, an other input green on the unfixed tree: met. `$HOME/.claude/./agents/`: right result refusal (184); line 112 derives the same spelling, so the unfixed tree refuses it; class not part of the defect (190); no test case (215); after the fix it gives what it gave (228, 237).
- Case 3, another defect: met. `CLAUDE_CONFIG_DIR="$HOME/.claude//"` at `pin.sh:79`: class another defect (191), written in the record with its result (193), not fixed (194), left as it was (228), left out of the result (238).
- Case 4, an input of the defect still red after the second change: met. Lines 230 (written as not fixed, with its result), 231 (its test case taken out, its failing run quoted), 232 (the Cause section and the final message name it), 236 and 240 (Done is met with the input quoted); template:80 and the "not fixed, with its result" cell.
- Case 5, a defect in text: met. Line 195 names the instruction as the operation; lines 196 and 197 read the other situations against the text; line 239 reads them again after the fix; line 219 asks for no test.
- Case 6, no person present: met. No Stops row is added and no step of 166 to 240 waits.
- Case 7, the numbering: met. `cmp exit 0`.

### Findings

#### 1. Spec

- none. The five fenced blocks are applied word for word, the delta touches only the paths and lines the round names, and nothing is added beyond the round brief. The check of a closure by removal: the "no reply" bullet and the inline definition went by the round's own ruling, and the removed test case of line 231 is the round's text; neither is the builder's removal.

#### 2. Proof

- 4-report.md, "Sentence and list-item rules (verify item 7)": "Each changed bullet is one rule except where a bullet holds a rule and its condition (lines 171, 173, 175, 229, 231), which skill-layout keeps in one bullet."; what is wrong: the list of over-20-word lines is complete (21 lines, reproduced), but the claim does not hold for two bullets. SKILL.md:186 "Run it on the tree without the fix and on the tree with the change of the probe that shows the cause, then undo that change as Steps 13 says." holds a run and an undo joined by "then". SKILL.md:231 "The test case of an input not fixed is taken out of the test, and its failing run is quoted in the record, so the test asserts no known defect." holds two actions joined by "and", and the second is not a condition of the first. Line 186 is not in the report's exception list; line 231 is listed as rule and condition. The decision resting on it: whether verify item 7 holds; failure scenario: the orchestrator reads the report as having held every changed bullet to "Lists and tables" and lands two bullets whose halves a later diff cannot tell apart; verdict: none on an item. The text of both bullets is the round brief's; the finding is on the report's claim, and the bullets are in Standards 2.

#### 3. Standards

- docs/glossary.md:93 and skills/repo-setup/templates/plan-terms.md:88 (**red command**), against SKILL.md:185, 186 and 235: glossary "the one command of a diagnosis that drives the code path of the symptom and goes red on the exact symptom"; skill "run each other input through the red command, with that input in place of the reported one and the assertion set to that input's right result."; what is wrong: the skill now uses **red command** for a command whose input and assertion change per run and that goes red on a wrong result for that input, which for an input whose right result is "not refused" is a different symptom from the reported one. The entry does not define that sense. docs/dev/skill-layout.md, "Writing for an agent": "A term that `docs/glossary.md` defines is used only in a sense it defines there. A skill that needs ... a term in a new sense, adds or changes its entry in `skills/repo-setup/templates/plan-terms.md` first." The builder's report names this (Terms, "Anything in the brief that was wrong") and leaves the entry unchanged because it is outside the step's paths (glossary lines 40 and 70, plan-terms lines 35 and 65); under change-standard "The rules" 4 that is a stop for the orchestrator. The entry is not false for the reported input; it is false as a description of the runs of lines 185, 186 and 235. Failure scenario: a reader of the glossary builds one fixed red command and reuses it unchanged for an other input whose right result is the opposite (the pair of different folders not yet made), gets red without the reported symptom, and cannot class it; or a reviewer holding the skill to the glossary finds the term used in a sense the entry lacks. Options for the orchestrator: widen the paths to the **red command** entry and its plan-terms copy so it covers a run with another input and its right result, or word the runs in the skill without the term. Verdict: item 2 violated (last clause).

- skills/diagnose/SKILL.md:186, 231 and 175, and 194 and 227: "Run it on the tree without the fix and on the tree with the change of the probe that shows the cause, then undo that change as Steps 13 says." / "The test case of an input not fixed is taken out of the test, and its failing run is quoted in the record, so the test asserts no known defect." / "The hypothesis gets one more probe in the form of Steps 12: its change made at the operation so that it also gives that input its right result, undone as Steps 13 says." / "An input of another defect is not fixed in this diagnosis." / "The fix is never one change per spelling."; what is wrong: docs/dev/skill-layout.md, "Lists and tables" first bullet: two requirements "joined by 'and', 'then', a semicolon or a second sentence, are two bullets" (186 run and undo, 231 take out and quote, 175 probe and undo). "Writing for an agent" first bullet: a rule written as a prohibition names the behaviour to do instead in the same bullet or in an Anti-patterns row; 194 and 227 are bare prohibitions whose alternative (193 "written in the record with its result", 226 "one change at the operation") now stands in the previous bullet, since the round split what round 0 held in one bullet; failure scenario: a reviewer checking a later diff cannot see that one half of 186 or 231 was dropped while the other half holds; an agent reading 227 alone has a prohibition and no action; verdict: none on an item. The text is the round brief's; the orchestrator rules on the split.

- skills/diagnose/SKILL.md:215 and 171: "The test has one test case for the shrunk case and one for each other input that is part of the defect, each asserting that input's right result, whether or not the change of the probe already gave it, so that a later fix that narrows again goes red." (49 words) / "When more than one hypothesis is left standing, the cause is the one that names what the operation itself does wrong (what it compares, looks up, writes or parses), over one that names a value the operation is given." (39 words); what is wrong: skills/repo-setup/templates/docs/dev/prose-standard.md, E "Sentence length": under roughly 20 words unless the mechanism needs more. The report's reasons are "the test-case rule with its purpose" and "a choice rule with the criterion in a parenthesis"; neither names a mechanism that needs the length, and the purpose clause of 215 ("so that a later fix that narrows again goes red") could be its own sentence. The Done lines (213, 234, 240) have base precedent at 54 and 35 words; 215 and 171 do not. Failure scenario: an agent parsing 215 has to hold the case set, the assertion, a condition and a purpose in one sentence; verdict: none on an item. The text is the round brief's.

- skills/diagnose/SKILL.md:184, docs/glossary.md:71, skills/diagnose/templates/diagnosis.md:86 and :88: "Each other input's right result is written in the record before its runs: the result the rule the operation breaks gives for that input." / "Its right result is the result the rule the operation breaks gives for it."; what is wrong: **right result** is a new term with no entry of its own, and its meaning is written twice, in the glossary entry **other input** and at line 184 (and in the template cell). skill-layout "Writing for an agent": "One meaning has one place"; the round removed the duplicate definition of **other input** for this reason (first-run Standards 4). Failure scenario: the two copies drift; a reader who looks for "right result" in the glossary finds no entry; verdict: none on an item. The text is the round brief's.

#### 4. Behaviour

- skills/diagnose/SKILL.md:171: "When more than one hypothesis is left standing, the cause is the one that names what the operation itself does wrong (what it compares, looks up, writes or parses), over one that names a value the operation is given."; what is wrong: on the step-3 record, hypothesis 2 (line 75 keeps the slashes) names a value the operation is given and is set aside. Hypothesis 1 ("line 317 compares ... with only one trailing slash removed, while line 112 removes every trailing slash") and hypothesis 3 ("compares the paths as written rather than the folders they name") both name what the comparison does, and the line picks neither. The first-run Behaviour 2 is not closed; the builder's own case reading says the text "does not choose between them". Failure scenario: a diagnosis states the cause as hypothesis 1 (the one-slash strip at line 317), with probe 1 as the probe that shows it; Steps 15's Done line (213) is met; the Cause section, which `land` Steps 9 books "with its cause", says a slash strip while the fix compares folders, and case 1 expects the cause "at the refusal's comparison ... not at the slashes". Verdict: case 1 partial. The wording is the round brief's, so the tie-break is the orchestrator's to write.

- skills/diagnose/SKILL.md:229-230, 236-237, 240: "When the change of the probe leaves an input that is part of the defect wrong, or makes an input that was right wrong, the fix is changed once more at the operation." / "An other input still wrong after that second change is written in the record as not fixed, with its result." / "Done when ... each other input gives the result its class requires, each quoted in the record, with an input written as not fixed quoted with its result."; what is wrong: line 230 covers any other input, including one that was right on the unfixed tree and that the second change broke, and line 237 ("Each input not part of the defect gives what it gave") has no exception, but line 240's Done accepts "an input written as not fixed quoted with its result". Failure scenario, on the step-3 defect with hypothesis 1 as the cause: probe 1's change leaves `agents/.` wrong, the agent's one second change compares resolved paths with `pwd -P`, and the pair of different agents and skills folders not yet made (right on the unfixed tree) now resolves both to an empty string and is refused. The count in 230 sends that input to "not fixed", Done at 240 is met, and the fix lands that refuses every folder not yet made, which is the behaviour case 1 says the fix must not have. The one second change has the extra probe of line 175 available only if the agent thinks to use it, since line 225 starts the fix from "the probe that shows the cause" and line 186 runs only that probe's change. The record names the regression (232), so it is disclosed, not prevented. Verdict: case 1 partial; case 4 met.

- skills/diagnose/SKILL.md:184 against the pair of different folders not yet made: "the result the rule the operation breaks gives for that input."; what is wrong: the rule is that a folder that is both a skill folder and an agent folder is refused; for two different folders the rule fires on nothing, so it gives no result, and the text does not say the right result is then the operation's ordinary one (the pin proceeds). The builder's reading ("no refusal") supplies it. The class of the two folders not yet made does come out right once that is read in: the same folder (spelled `agents//` or `agents/.`) is wrong on the unfixed tree at line 317, so part of the defect, and the different folder is right on the unfixed tree, so not part of the defect, and wrong under the resolved-path probe, which is what separates empty-string resolution. Failure scenario: an agent leaves the Right result cell empty for the pair, cannot class it ("right on the tree without the fix" needs a right result), and drops it from the list, so Steps 18 and 19 no longer keep the fix from treating the pair as equal; verdict: case 1 partial.

- skills/diagnose/SKILL.md:172-175 against Steps 12 and 14 (166 precedes them in the text order, but they run first): "A hypothesis whose probe broke an other input is not falsified by that input."; what is wrong: Steps 12 records "falsified or still standing" from the hypothesis's own falsifier, written at Steps 7 (hypothesis 3 of the step-3 record names "or the change breaking the setup pin"), and Steps 14 forms a second list "when every hypothesis is falsified"; the rule that a broken input does not falsify is in Steps 15, after both. The template's Probes cell says "still standing, with each other input its change broke", which Steps 12 does not tell the agent to write. Failure scenario: a defect whose only correct hypothesis has a probe that stops the red command in its setup is recorded falsified at Steps 12, and when no other hypothesis stands Steps 14 forms a second list before Steps 15 reopens it. In the step-3 run hypotheses 1 and 2 stand, so the case-1 path is unaffected; verdict: none on an item (Steps 12 and 14 are outside the brief's list of changed steps, so the orchestrator rules whether to widen).

### Closure of the first-run findings

- Spec 1 (rerun with a changed setup, lines 174 and 175 of round 0): closed. The text now gives the hypothesis one more probe "in the form of Steps 12", made at the operation and "undone as Steps 13 says" (lines 172 to 175); no second red command or setup change remains, and the probe is recorded in the Probes row.
- Spec 2 (Done line against a red test case for an input not fixed): closed. Line 231 takes the case out of the test and quotes its failing run; lines 236 and 240 except an input written as not fixed. The tension with change-standard rule 9 ("no check is loosened to pass") is the orchestrator's ruling (Declined to judge).
- Proof 1 (long lines unnamed): partly closed. The 21 over-20-word lines are named and reproduce; the claim "every changed bullet is one rule" still fails at lines 186 and 231 (Proof above).
- Proof 2 (case 1 reading): closed. The report numbers the hypotheses as the step-3 record does (1 line 317, 2 line 75, 3 the paths as written), classes the same-folder and the different-folder agents folders not yet made from lines 189 to 191 with the lines quoted, and says line 171 does not choose between hypotheses 1 and 3.
- Standards 1 (line 221 against 222 and 224, and the Probes caveat): closed. The old line 221 is gone, line 225 reads "starting from the change of the probe that shows the cause", and the hypothesis stays standing in its Probes row.
- Standards 2 (several rules in a bullet; sub-lists introduced by a full stop): partly closed. Lines 173, 182, 190, 225, 229 are split and 177 and 185 now end in colons; new instances stand at 175, 186, 231, 194 and 227 (Standards above).
- Standards 3 (line 194 and line 189): closed. Line 194 is removed and line 192 reads "so its failure costs what the reported input's failure costs".
- Standards 4 (the entry's sentence 2 false for text; the duplicate definition): closed for both parts; the entry now says "in a defect in text it is read against the text" and the inline definition is gone. The duplicate meaning of the new term **right result** is a new finding.
- Standards 5 (template line 80): closed. It reads "each other input written as not fixed, or "none"", matching line 232.
- Behaviour 1 (an input whose right result is the opposite has no class): closed in the text by the right result and the classes of lines 184 to 191, with the glossary conflict in Standards 1 above.
- Behaviour 2 (line 170 chooses between nothing): not closed (Behaviour 1 above).
- Behaviour 3 (the changed probe behaviour not listed): closed. The report's "Host- or user-visible changes" names the broken input recorded with one more probe (its second item), the right result per other input (third item) and the removed test case with its run quoted (sixth item).

### Declined to judge

- Whether the unfixed `pin.sh` refuses an agents folder not yet made spelled `<x>/agents//` or `<x>/agents/.`, and does not refuse two different folders not yet made. I read both from lines 112 and 317 as `3-blind-comparison.md` quotes them and did not run `pin.sh` or the red command on the comparison's input tree; a run of the step-3 `red.sh` with each input on that tree would settle it.
- Whether a diagnosis following the text wins or ties the rerun of the blind comparison; that is the orchestrator's comparison after landing and Axel's call.
- Whether removing a failing test case (line 231) is the loosened check that change-standard "The rules" 9 forbids or the known defect it also forbids a test to assert; the round chose the second, and I do not reopen the ruling.
- Whether the one-second-change count of lines 229 and 230 (brief decision 5) should stay; it is the brief's design, and it bears on Behaviour 2 above.
- The sentence-length reasons of the Done lines 213, 234 and 240 (43, 36 and 42 words), which have base precedent; I judged only the non-Done lines 215 and 171.

Agent usage: ac15089b4a5587f45, claude-sonnet-5-5, 204452 tokens, 28 tool uses, 6.9 minutes.

## Closed

The first run's findings were sent in repair round 1 (`agents/briefs/4-round-1.md`); the run over round 1 reads Spec 1, Spec 2, Proof 2, Standards 1, Standards 3, Standards 4, Standards 5, Behaviour 1 and Behaviour 3 as closed, and Proof 1, Standards 2 and Behaviour 2 as partly closed or open. Those three, and every finding of the run over round 1, are closed at landing on main by the orchestrator, as below. No finding is raised to the user.

- First run, Proof 1, and round 1, Proof (the claim "every changed bullet is one rule"): a defect of the builder's report, not of the skill. The bullets it names (lines 175, 186 and 231 of the round's text) are split at landing (round 1, Standards 2 below), so the claim no longer has an exception left in the text.
- First run, Standards 2, and round 1, Standards 2 (several rules in one bullet; bare prohibitions): at landing, the probe bullet of Steps 15 is split ("... gives that input its right result." / "That probe's change is undone as Steps 13 says."); the run bullet is split ("Run it on the tree without the fix and on the tree with the change of the probe that shows the cause." / "Undo that change as Steps 13 says."); the test-case bullet of Steps 18 is split ("The test case of an input not fixed is taken out of the test, so the test asserts no known defect." / "The failing run of that test case is quoted in the record."); "An input of another defect is not fixed in this diagnosis." becomes "An input of another defect is left for a diagnosis of its own."; "The fix is never one change per spelling." becomes "The fix is that one change, never one change per spelling."
- First run, Behaviour 2, and round 1, Behaviour 1 (the tie-break chooses neither hypothesis 1 nor 3): at landing, Steps 15's tie-break becomes "When more than one hypothesis is left standing, the cause is the one that names what the operation gets wrong for every form of its input.", with the sub-bullet "A hypothesis that names how the operation treats one form of a value, such as one spelling, is set aside for the cause." On the step-3 record, hypothesis 1 (one trailing slash removed) names one form and is set aside; hypothesis 3 (the paths compared as written rather than the folders they name) is the cause.
- Round 1, Standards 1 (**red command** used in a sense its entry lacks): at landing, the entry in `docs/glossary.md` and `plan-terms.md` gains "Run for an other input, it takes that input in place of the reported one and asserts that input's right result." and its "Stated in" reads "`diagnose`, Steps 4, 15 and 19". The glossary is in the step's paths.
- Round 1, Standards 3 (lines 215 and 171 over 20 words): line 215 is split into "The test has one test case for the shrunk case and one for each other input that is part of the defect." and "Each test case asserts its input's right result, whether or not the change of the probe already gave it, so a later fix that narrows again goes red."; line 171 is replaced by the tie-break above (24 words, its criterion in a sub-bullet).
- Round 1, Standards 4 (**right result** defined twice, with no entry): at landing, a glossary entry **right result, of an other input** is added after **reviewer** in both files ("the result the rule the operation that goes wrong gives for an other input, or, where that rule does not apply to the input, the result the operation gives when it works as meant. Stated in: `diagnose`, Steps 15."). Steps 15 now reads "Each other input's right result is written in the record before its runs."; the entry **other input** reads "Its right result is written before its runs."; the template's cell reads "<this input's right result>".
- Round 1, Behaviour 2 (a second change that breaks an input not part of the defect lands as "not fixed"): at landing, Steps 18 gains "The second change leaves every input not part of the defect as it was on the tree without the fix.", and the not-fixed bullet is narrowed to "An input that is part of the defect and still wrong after that second change is written in the record as not fixed, with its result."
- Round 1, Behaviour 3 (a rule that fires on nothing for two different folders gives no right result): closed by the entry **right result, of an other input**, whose second clause gives the operation's result when it works as meant (for two different folders not yet made: not refused).
- Round 1, Behaviour 4 (Steps 12 records "falsified" before Steps 15 says a broken input does not falsify): at landing, Steps 12 gains "A probe that breaks an other input, as Steps 15 says, leaves its hypothesis still standing, and the row names that input." This is inside the step's part (the whole of `skills/diagnose/SKILL.md` is in its paths); the step numbering is unchanged.

Checked at landing on main after these fixes: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`; the numbering string of `grep -o '^[0-9]*\. ' skills/diagnose/SKILL.md | tr -d '\n'` equals the base's; `sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md` printed `checks: 6 commands passed`.

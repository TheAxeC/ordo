# Report of step 5, `diagnose` fixes the same defect wherever it occurs and checks a symptom it does not reproduce

Everything in the brief is done. No case was stopped on: the first run found no case the brief's rules get wrong. The one reading the brief leaves to the text is case 2's split of a list from a path, and it is listed under the judgment calls with the bullet that carries it.

## Open items of the state file

The state file's "Open items" section (`sed -n 43,47p .scratch/2-f-diagnose/orchestrator-state.md`) reads, after its heading, `- none`. The position line reads `- Open items for you: none.`

## The cases' first run, on the unchanged tree (88aa65b), by reading

Read from `skills/diagnose/SKILL.md` at the base (369 lines) with the `utils/pin.sh` lines quoted in the brief. Result per case, then whether the brief's rules get the case right.

1. The step-3 defect, the cause at line 317. Unchanged text: Steps 15 says "The cause is stated at the operation that goes wrong: the comparison, the lookup, the write or the parse", and line 184 reads only back ("from the shrunk case back to where the inputs come from"). Nothing reads forward from lines 70-76 and 78-81 to line 112 or line 79. Line 112 is wrong at another operation, so it is "another defect: wrong on the tree without the fix, at another operation" (line 195), "left for a diagnosis of its own" (line 198). Steps 18 line 231 makes "one change at the operation", so the fix covers line 317 only. Result: unmet, as the brief says of the old text. The brief's rules (items 1 to 5) give the expected result: rule at the value, lines 79 and 112 further places, three inputs part of the defect, a fix at 79, 112 and 317.
2. A skill folder with a space in `ORDO_SKILL_DIRS`, split at line 73. Unchanged text: the input is wrong at line 73 only, which is "another operation" (line 195), so it is classed another defect, written with its result (line 197), left alone (lines 198 and 233). Result: met. The brief's rules give the same class provided the split of a list is a rule other than the rule on a path (judgment call 1).
3. The reported "removing links", asserted as "links unchanged" and green. Unchanged text: Steps 4 line 107 says "Its output shows the result of each part", and the step-4 red command printed `part 4 links unchanged: ok`; no text says what to do with a part whose assertion is green on the red runs, and Rules (lines 339 to 369) hold no rule on a statement about the code. Result: unmet. The brief's items 10 to 14 give the expected result: the part is listed as not caught, lines 430-438 are read along the red command's path (they remove every link into the pinned worktree whose name is not an agent of the tag, including the skill links made at 388-410), the red command is changed to assert line 436's output or the links between linking and the final check, and the part is stated as reproduced.
4. A part the code does not produce on the path. Unchanged text: no place and no rule; the only "not reproduce" text is line 116, about a scratch copy that cannot reproduce at all. Result: unmet. The brief's items 10, 11 and 13 give the expected result.
5. A further place found after the fix. Unchanged text: lines 234 to 236 allow a second change "at the operation" and write an input still wrong as "not fixed"; a place at another operation is another defect (line 195) and is not widened to. Result: partial. The brief's items 8 and 5 give the expected result inside the count of two changes.
6. The user name compared case-sensitively at one place and looked up in a map keyed by lower case at another. Unchanged text: the cause is stated at one operation; the other operation is "another defect" and "left for a diagnosis of its own". Result: unmet. The brief's items 1 to 5 give the expected result (rule "a user name is read without regard to letter case", both places named, a test case for each).
7. A defect in text with a second instruction of the same kind. Unchanged text: lines 199 to 201 take the other inputs to be "the other situations that instruction governs", so a second instruction is not reached. Result: unmet. The brief's item 9 gives the expected result.
8. A diagnosis agent with no person present. Unchanged text: Rules line 339 gives no waits to a session with no person present, and the new work does not exist yet. Result: met on the old text; the case constrains the new text. The brief's rules raise no stop.
9. The numbering. `grep -o '^[0-9]*\. ' skills/diagnose/SKILL.md | tr -d '\n'` on the base prints `1. 2. 3. 4. 5. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 24. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. `. Result: the string the brief expects.

Cases the brief's rules got wrong: none. No ruling carried.

## DONE / NOT DONE

Run from the worktree root after the last change.

| Item | Status | Command and output |
|---|---|---|
| Glossary block equals the template | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0 |
| Character-set check over the four changed files | DONE | `git ls-files -coz --exclude-standard -- skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md docs/glossary.md skills/repo-setup/templates/plan-terms.md \| xargs -0 perl -CSD -ne '...'` printed nothing, exit 0 |
| `description` length | DONE | `python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/diagnose/SKILL.md").read().split("---")[1])["description"]))'` printed `965` |
| Numbering of `diagnose` | DONE | `grep -o '^[0-9]*\. ' skills/diagnose/SKILL.md \| tr -d '\n'` printed `1. 2. 3. 4. 5. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 24. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. `, and `git show HEAD:skills/diagnose/SKILL.md \| grep -o '^[0-9]*\. ' \| tr -d '\n'` printed the same string |
| `metadata.version` | DONE | `grep -n 'version:' skills/diagnose/SKILL.md` printed `5:  version: "2.1.0"` |
| Items 1 to 9 (Steps 15, 18, 19, 16) | DONE | Read against the diff, `git diff skills/diagnose/SKILL.md`; the cases below quote the deciding lines |
| Items 10 to 14 (Steps 4, Rules) | DONE | Same |
| Items 15 to 17 (template) | DONE | `git diff skills/diagnose/templates/diagnosis.md` |
| Items 18 and 19 (terms) | DONE | Entries changed in `plan-terms.md` first, then the same text in `docs/glossary.md`; the sync line above |
| Items 20 and 21 | DONE | numbering and version lines above; `git status --short` prints only the four files, plus this report |
| The plan's whole verify list | Not run, by the brief: it runs once at landing on main |

## The cases read against the changed text

1. Rule at the value: Steps 15, "The rule is stated at the kind of value the operation reads: how a value of that kind must be read or treated." and "For a path, the rule reads "a path is read as the folder it names, whatever its spelling"." The run is led forward from both sources: "Read forward from every place a value of the kind the rule is about is read or assembled to every operation that uses it." and "Every source counts: each environment variable, configuration entry and default that supplies such a value." Line 112 (a derivation) and line 79 (a comparison) are places: "A place is any operation that reads a value of the kind the rule is about and breaks the rule, whether a comparison, a derivation, a lookup, a write or a parse." `C/skills/.`, `C//skills` with `C/skills` and `CLAUDE_CONFIG_DIR="$HOME/.claude//"` are wrong at a place, so they are "part of the defect: wrong on the tree without the fix at a place of the defect"; Steps 16: "One of those test cases reaches each place of the defect and asserts the right result there." Steps 18: "Where the places can share one change, the fix is that change: a helper every place calls, or one written form made at every source the values come from." and "The fix covers every source a value of the kind the rule is about comes from." Met.
2. Space in `ORDO_SKILL_DIRS`: Steps 15, "An operation that breaks only a rule of the container, such as how a list is divided into values, is not a place of the defect." The split at line 73 breaks the list's division rule only, so the input is "another defect: wrong on the tree without the fix only at an operation that breaks another rule", "written in the record with its result" and "left for a diagnosis of its own"; Steps 18: "An input of another defect is left out of the result, and the fix is not widened to make it right." Met.
3. Removing links: Steps 4, "The record's Red command section lists each part of the reported symptom with whether the red command catches it.", "A part with no assertion, or with an assertion that is green on those runs, is not caught.", "Once the red command is red on the parts it catches, read the code that would produce each part it does not catch, along the path it drives.", "When the code produces the part on that path, the red command is changed to assert it where it happens.", "The assertion is on an output line, an intermediate state or a check before the run ends, since the end state can be unchanged when the run undoes its own change." and "The part is then red and asserted like the others." The Done line of Steps 4 requires the changed command's three runs and the list. Rules: "A statement about what the code does, such as "the cache is cleared only on restart", goes in the record and the final message only with the lines it rests on, read in this run." Met.
4. Not produced: "A part is called not reproduced, in the record or the session's final message, only when the code read along that path does not produce it." and "A part written as not reproduced carries the lines read and why they do not produce it." The template's parts table has the columns "Lines read, for a part not caught" and "Reproduced". Met.
5. A place found after the fix: Steps 18, "A place found only after the fix is made goes back through Steps 15 to 17.", "Its test case is run on the tree as the first change left it, and its failure quoted.", "The second change may widen the fix to that place." and the unchanged "An input that is part of the defect and still wrong after that second change is written in the record as not fixed, with its result." Met.
6. User name: rule "a user name is read without regard to letter case" by "A rule that states only what the one operation does, such as "two spellings compare equal", is restated at the kind of value." The lookup in the map keyed by lower case is a place ("whether a comparison, a derivation, a lookup, ..."), found by reading forward from the place the name is read. Steps 16 gives a test case reaching each place and Steps 18 one change where the name is read or one at each place. Met.
7. Defect in text: Steps 15, "For a defect in text, the kind of value is the kind of situation the instruction governs.", "For a defect in text, a further place is another instruction of the same text that governs a situation of that kind against the same rule." and "For a defect in text, the other inputs are the other situations that the instruction and each further place govern."; Steps 19, "For a defect in text, each place and each other situation is read again against the text after the fix and quoted in place of a run."; Steps 16, "A defect in text is fixed by reading, with the text quoted before and after and no test." Met.
8. No person present: `git diff -U0 skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md | grep '^+[^+]' | grep -i -n 'stop\|wait\|ask\|reply\|user'` prints nothing (exit 1); Rules' first bullet ("Who is present decides the waits") is unchanged. Met.
9. Numbering: the string printed above equals the base's. Met.

## The terms

Entries added or changed in `skills/repo-setup/templates/plan-terms.md` first, then the same text in `docs/glossary.md` (`sync_rules.py` prints the ok line above).

- **other input** changed. Before: "an input other than the reported one that reaches the operation that goes wrong ... Each is put in one of three classes: part of the defect, not part of the defect, or another defect." After: "... that reaches a place of the defect ... run through the red command ... at each place of the defect it reaches ... Each is put in one of three classes: part of the defect, wrong on the tree without the fix at a place of the defect, also when it is wrong at an operation of another rule; not part of the defect, right on the tree without the fix; or another defect, wrong on the tree without the fix only at an operation that breaks another rule." Stated in `diagnose`, Steps 15 to 19: `grep -n 'other input' skills/diagnose/SKILL.md` prints lines 187 to 245 (Steps 15), 247 (Steps 16), 264 (Steps 18) and 280 and 285 (Steps 19).
- **right result, of an other input** changed. Before: "the result the rule the operation that goes wrong gives for an other input, or, where that rule does not apply ..., the result the operation gives when it works as meant." After: "the result the cause's rule gives for an other input at whichever place of the defect the input is read, or, where that rule does not apply ..., the result the operation that goes wrong gives when it works as meant." Stated in `diagnose`, Steps 15: `grep -n 'The right result is the one the cause' skills/diagnose/SKILL.md` prints line 209, inside Steps 15 (lines 177 to 245).
- **place, of a defect** added, before **place, of a point**: "an operation of any kind, such as a comparison, a derivation, a lookup, a write or a parse, that reads a value of the kind the cause's rule is about and breaks that rule. The operation the cause names is the first place, and each further place is named in the diagnosis record with its file and line, or its section for a defect in text. The fix covers every place." Stated in `diagnose`, Steps 15, 16, 18 and 19: `grep -n 'place of the defect\|places of the defect\|further place' skills/diagnose/SKILL.md` prints lines 192 to 245 (Steps 15), 248 and 254 (Steps 16), 259 to 279 (Steps 18) and 285 (Steps 19).
- **red command**, **diagnosis record**, **case, of a diagnosis**, **probe**, **hypothesis**: used in the changed text in the sense their entries give; their text is not made false (the red command is still the one command run red and quoted; the record still holds the red command with its runs and the operation with its other inputs).
- The word "kind" in "kind of value" is plain English; the glossary term **kind** (a sentence under which `/plan-retro` groups findings) is not used. "Place" in Steps 16 line 246 ("at the place the defect occurs") and in "A place no test can reach the defect" is unchanged text and means a location.
- The class names "part of the defect", "not part of the defect" and "another defect" keep their names.

## Files, lines before and after

- `skills/diagnose/SKILL.md`: 369 to 408 (`git diff --numstat`: 61 added, 22 removed).
- `skills/diagnose/templates/diagnosis.md`: 131 to 146 (20 added, 5 removed).
- `docs/glossary.md`: 149 to 150 (3 added, 2 removed).
- `skills/repo-setup/templates/plan-terms.md`: 132 to 133 (3 added, 2 removed).
- This report: `.scratch/2-f-diagnose/agents/reviews/5-report.md`.

## Lines over 20 words

Counted with the bullet marker removed, over the added lines of the diff. All are one rule or one definition that needs its qualifier in the same bullet (`docs/dev/skill-layout.md`, "Lists and tables"); the Done lines already ran to 48 to 58 words before the step.

- Steps 4: "Code read for a part ..." (24, the exception that settles the clash with the Anti-patterns row); "Once the red command is red ..." (28, condition and action); "The assertion is on an output line ..." (31, the forms and the reason an end-state assertion fails); "A part is called not reproduced ..." (26); the Done line (88, three endings joined, as the line it replaces, which ran to 58).
- Steps 15: "The rule is stated at the kind of value ..." (23); "A rule that states only what the one operation does ..." (23, with its example); "A place is any operation ..." (32, the definition with the kinds of operation); "The record names each further place ..." (25); "Read forward from every place ..." (24); "An operation that breaks only a rule of the container ..." (26, the exception with its example); "Find them by reading ..." (29, was 24, names each place); "An input wrong at a place ..." and "An input that is part of the defect breaks ..." (21 each); "For a defect in text, a further place ..." (26); "Write the operation, the rule ..." (32, a list of what the section holds); the Done line (60, was 40).
- Steps 16: the Done line (28).
- Steps 18: "Where the places can share one change ..." (29, the rule with its two forms); "The fix at a place is one change ..." (25); "An input of another defect is left out ..." (21); "When the change of the probe leaves ..." (30, was 33); the Done line (45).
- Steps 19: "Each input that is part of the defect ..." (26); "For a defect in text, each place ..." (27); the Done line (48).
- Anti-patterns row 1 (54, the table row; the Do instead cell gained "which also says what code may be read once it is red").
- Rules: "A statement about what the code does ..." (35, rule with its example).
- Template: placeholders of table cells and the Cause placeholder (up to 155 words for the row of eight cells, which held 70 before); each placeholder lists the alternatives the cell can take.

## Judgment calls the brief left open

1. Case 2's class rests on separating the rule of the container from the rule of the kind of value. Steps 15 carries it as "An operation that breaks only a rule of the container, such as how a list is divided into values, is not a place of the defect." Without it, the rule "a path is read as the folder it names" read literally would also take the split of a path that holds a space as a place of the defect.
2. Steps 16: the brief gives a test case per input and case 6 asks for "a test case for each"; the added bullet "One of those test cases reaches each place of the defect and asserts the right result there." makes each place reached.
3. Steps 18: a place found after the fix has its test case run "on the tree as the first change left it", since the tree without the fix is no longer the tree the probes ran in. This serves item 8.
4. Steps 15 line 196 (now "An input that is part of the defect breaks the cause's rule, so its failure costs what the defect's failure costs."): the old "at the same operation as the reported input" is false for a further place, so the sentence rests on the cause's rule.
5. The Done line of Steps 4 is reordered (the two endings without a run first) so that the list of parts binds only the ending that has a run.
6. New glossary entry: only **place, of a defect**. A part of the symptom is described in Steps 4 itself ("A part is caught when its assertion is red on the red command's runs.") and gets no entry.
7. The Anti-patterns row 1 gains a pointer in its Do instead cell; the allowance itself is the Steps 4 bullet beside the existing line 105 bullet.
8. Item 14's rule is in "Rules" (line 405, after "A captured artifact is quoted only in the lines that carry the symptom."), as the brief's Decision 5 says.

## Host- or user-visible changes

- `/diagnose` Steps 4: the record lists each part of the symptom with whether the red command catches it; a part it does not catch is read in the code, and the red command is changed to assert it where it happens; "not reproduced" needs the lines read. Before: Steps 4 asked the command to assert every part and said nothing of a part whose assertion passed.
- `/diagnose` Steps 15, 16, 18, 19: the cause's rule is stated at the kind of value; every place of the defect is found and fixed; the classes are defined by places. Before: the cause was stated at one operation, the fix was "one change at the operation", and an input wrong at another operation was "another defect" left alone.
- Rules: a statement about what the code does goes into the record and the final message only with the lines it rests on.
- Template `skills/diagnose/templates/diagnosis.md`: a parts table in "Red command"; the rule, the places and a "Place at which it is wrong" column in "Operation and other inputs"; "Places the fix covers" in "Fix and test"; the Cause placeholder names the rule and the places. The section names are unchanged.
- Glossary and `plan-terms.md`: the entries above.

## Anything in the brief that was wrong or impossible

- The brief's convention "no mention of `utils/pin.sh`" in the skill's text: `skills/diagnose/SKILL.md:102` names `utils/pin.test.sh` ("... set under `$TMPDIR`, as `utils/pin.test.sh` sets them."). The line is unchanged text outside the brief's items; `git grep -n -i 'utils/pin\|diagnosing-bugs\|mattpocock' -- skills/diagnose` prints only that line. Removing it is the orchestrator's call.
- The brief's header says line numbers were "checked on main at ba08035"; the base is 88aa65b. The counts it quotes (369 lines, version line 5, step lines 104, 167, 230 and 242 at the base, 965 characters) held when read at the start.

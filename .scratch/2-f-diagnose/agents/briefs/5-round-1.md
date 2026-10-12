# Step 5, repair round 1

The round starts from the worktree as you left it (`git diff 88aa65b | shasum` printed at the round's start is in the dispatch entry). The findings are in `agents/reviews/5-refuter.md`. The brief `agents/briefs/5.md` holds unchanged except where a ruling below changes what it asked for, and every check of its "Verify before you report" is run again after the round. The paths are the brief's "Paths this step writes"; the round writes no other path. Each ruling below says what to change; a line in quotes, or in a fenced block, is the text, word for word. Line numbers are those of your worktree before the round.

1. **Spec 1 (`skills/diagnose/SKILL.md:199`).** The bullet "An operation that breaks only a rule of the container, such as how a list is divided into values, is not a place of the defect." is replaced by these two bullets, in this order, at the same indentation:

```
    - When the cause's rule is about the values a container holds, an operation that breaks only a rule of the container, such as how a list is divided into values, is not a place of the defect.
    - When the cause's rule is the container's own rule, every operation that breaks it is a place of the defect.
```

2. **Spec 2 and Standards 3 (Steps 18, lines 270 to 279).** The bullets from "A place found only after the fix is made goes back through Steps 15 to 17." through "The Cause section and the session's final message name each input not fixed." become the lines below, in this order; "A guard for a fix is an Anti-patterns row." follows them unchanged, and the Done line is item 3's.

```
    - A place found only after the fix is made goes back through Steps 15 to 17.
    - On the way back, the runs of Steps 15 and 17 are on the tree as the first change left it.
    - The undoing of Steps 13 does not apply to the fix.
    - The failure of the new place's test case on that tree is quoted in the record.
    - The second change may widen the fix to that place.
    - After the second change, every input not part of the defect still gives its right result.
    - An input that is part of the defect and still wrong after that second change is written in the record as not fixed, with its result.
    - A place of the defect still giving a wrong result after the second change is written in the record as not fixed, with each input wrong there and its result.
    - The test case of an input not fixed is taken out of the test, so the test asserts no known defect.
    - The failing run of that test case is quoted in the record.
    - The Cause section and the session's final message name each input not fixed and each place not fixed.
```

3. **Standards 1 (`SKILL.md:266` and the Done line `:279`).** "A fix that leaves a place of the defect unchanged is not done." becomes "A fix that leaves a place of the defect giving a wrong result is not done, apart from a place written as not fixed." The Done line of Steps 18 becomes:

```
    - Done when the fix is in the tree the probes ran in and no place of the defect gives a wrong result, apart from a place written as not fixed, and the record quotes the fix, with each input and each place not fixed written in the record, or for a defect in text quotes the text after.
```

4. **Standards 3 (`SKILL.md:268`).** "An input of another defect is left out of the result, and the fix is not widened to make it right." becomes two bullets: "An input of another defect is left out of the result." and "The fix is not widened to make an input of another defect right."

5. **Standards 4 (`SKILL.md:221`).** The bullet becomes "An input that is part of the defect is wrong at a place of the defect, so its failure costs something whenever the reported input's failure does."

6. **Standards 5 (the word "place").**
   - `SKILL.md:197` becomes "Read forward from every source where a value of the kind the rule is about is read or assembled to every operation that uses it."
   - `SKILL.md:246` becomes "16. For a defect in code whose failure costs something, write a test that reproduces the shrunk case and reaches each place of the defect."
   - `SKILL.md:120`: "a failing test at the place the defect occurs" becomes "a failing test of the code where the symptom occurs".
   - `SKILL.md:252`: "A place no test can reach the defect as it occurs is written in the record under "No test reaches it", with the reason." becomes "A place of the defect no test can reach is written in the record under "No test reaches it", with the reason."
   - Then `grep -n 'place' skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md`, and every other use in Steps 4 and 15 to 19 and in the template that names where a defect is in the singular, or uses "place" for a location of code beside a place of the defect, is reworded so "place" there means only **place, of a defect**. The uses "in place of" (an idiom) and "its place (the file and line, or the section of a text)" at `:179` stay. Your report lists each use the grep prints with what you did to it.

7. **Standards 6 (the glossary entry **other input**).** In `skills/repo-setup/templates/plan-terms.md` first and then `docs/glossary.md`, the same in both, the sentence from "Each is put in one of three classes:" to "...that breaks another rule." becomes:

```
Each is put in one of three classes. Part of the defect: wrong on the tree without the fix at a place of the defect, also when it is wrong at an operation of another rule. Not part of the defect: right on the tree without the fix. Another defect: wrong on the tree without the fix only at an operation that breaks another rule.
```

8. **Standards 7 (the template's Red command section and the Reproduced cell).**
   - The placeholder `<the one command>` becomes `<the one command; when a part of the symptom was not caught and the command was changed to assert it, the command as changed>`.
   - The Reproduced cell becomes `<yes, caught; or yes, caught once the red command was changed to assert the part where it happens, the changed command and its runs being the ones in the blocks above; or not reproduced, with why the lines read do not produce it>`.

9. **Proof 1 and Proof 2 (the report).** In your report:
   - The character-set row of "DONE / NOT DONE" quotes the full command as run, with nothing shortened.
   - "Lines over 20 words" also names each sentence over 20 words of the three glossary entries the diff writes (**other input**, **place, of a defect**, **right result, of an other input**), with why each keeps its form, and every line this round adds or changes over 20 words.

10. **Declined to judge 2 (`SKILL.md:102`), the brief's Conventions ("no mention of ... `utils/pin.sh`").** The bullet becomes "A red command that would touch the user's real home, the installed skills or the pinned checkout runs with the variables that name those folders set to folders under `$TMPDIR`." The path list is unchanged: the line is in `skills/diagnose/SKILL.md`.

Not yours, closed by the orchestrator: the version (Declined to judge 1) stays 2.1.0 by the brief's Decision 6.

Add a section "Repair round 1" to your report: each item above DONE or NOT DONE with the command or the lines that prove it; every check of the brief's "Verify before you report" rerun and quoted verbatim, the character-set check's line and exit status included; every case of the brief's "Cases" read again against the round's text with the deciding lines quoted (case 5 above all, against item 2); and the files changed in the round with line counts.

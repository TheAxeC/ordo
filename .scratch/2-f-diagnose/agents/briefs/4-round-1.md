# Step 4, repair round 1

The round starts from the worktree as you left it (`git diff 8b93c6f | shasum` printed at the round's start is in the dispatch entry). The findings are in `agents/reviews/4-refuter.md`. The brief `agents/briefs/4.md` holds unchanged except where a ruling below changes what it asked for, and every check of its "Verify before you report" is run again after the round. The paths are the brief's "Paths this step writes"; the round writes no other path. Each ruling below says what to change; a line in quotes is the text, word for word.

1. **Behaviour 1, Behaviour 2, Spec 1, Standards 2 and Standards 4 (Steps 15).** In `skills/diagnose/SKILL.md`, the bullets of Steps 15 from "The cause is stated at the operation that goes wrong" through "This work goes on without a reply, run by a person or with no person present." are replaced by the lines below, in this order, with the indentation shown (four spaces for a bullet, six for a sub-bullet). Line 166 (the step's first line) and the bullets after them, from "The cause is not found when the second list is falsified too", stay as they are.

```
    - The cause is stated at the operation that goes wrong: the comparison, the lookup, the write or the parse that gives the wrong result.
    - The operation is given with its place (the file and line, or the section of a text) and the rule it breaks.
    - A cause stated as a property of the reported input, such as "the path has two trailing slashes", is not stated at the operation.
      - It is restated at the operation that treats that input wrongly.
    - When more than one hypothesis is left standing, the cause is the one that names what the operation itself does wrong (what it compares, looks up, writes or parses), over one that names a value the operation is given.
    - A hypothesis whose probe broke an other input is not falsified by that input.
      - The probe broke the input when, with the probe's change, the red command went wrong on that input or stopped at it in its setup before the reported input was reached.
      - The broken input is recorded as an other input, in the probe's row of the Probes section.
      - The hypothesis gets one more probe in the form of Steps 12: its change made at the operation so that it also gives that input its right result, undone as Steps 13 says.
    - With a cause found, list each other input that reaches the operation:
      - another spelling of the same value: repeated or trailing separators, `.` parts, letter case, an encoding;
      - another name for the same thing: a link, an alias;
      - a value not yet there: a path not yet made, an empty value;
      - each other input the code that feeds the operation admits.
    - Find them by reading the code or text that produces the operation's inputs, from the shrunk case back to where the inputs come from.
    - The list holds the inputs the code admits.
    - The reported input is not on the list.
    - Each other input's right result is written in the record before its runs: the result the rule the operation breaks gives for that input.
    - For a defect in code, run each other input through the red command, with that input in place of the reported one and the assertion set to that input's right result.
    - Run it on the tree without the fix and on the tree with the change of the probe that shows the cause, then undo that change as Steps 13 says.
    - Record each result, right or wrong against the input's right result.
    - Put each other input in one of three classes, named in the record as written here:
      - part of the defect: wrong on the tree without the fix, at the operation the cause names;
      - not part of the defect: right on the tree without the fix;
      - another defect: wrong on the tree without the fix, at another operation.
    - An input that is part of the defect fails at the same operation as the reported input, so its failure costs what the reported input's failure costs.
    - An input of another defect is written in the record with its result.
    - An input of another defect is not fixed in this diagnosis.
    - For a defect in text, the operation is the instruction that led to the wrong behaviour.
    - For a defect in text, the other inputs are the other situations that instruction governs.
      - Each is read against the text in place of a run, and put in the same three classes.
    - Write the operation, the list, each right result and each result into the record's "Operation and other inputs" section.
```

   The bullet "An other input is an input other than the reported one that reaches the operation." goes (its meaning has one place, the glossary entry of item 4). The bullet "This work goes on without a reply, ..." goes (Steps 15 to 19 hold no wait, and "Rules" takes the waits from "Stops"). Steps 15's Done line stays as you wrote it.

2. **Spec 2 and Standards 2 (Steps 16 and 18).** In Steps 16, the bullet "The test has one test case for the shrunk case and one for each other input that is part of the defect, ..." becomes:

```
    - The test has one test case for the shrunk case and one for each other input that is part of the defect, each asserting that input's right result, whether or not the change of the probe already gave it, so that a later fix that narrows again goes red.
```

   In Steps 18, the step's first line and its four new bullets (from "The fix is one change at the operation" through "... say the fix does not cover it.") become the lines below; "A guard for a fix is an Anti-patterns row." and the Done line follow them unchanged.

```
18. Make the fix at the operation the cause names, starting from the change of the probe that shows the cause.
    - The fix is one change at the operation, right for the reported input and for every other input that is part of the defect.
    - The fix is never one change per spelling.
    - Every input not part of the defect, and every input of another defect, gives what it gave on the tree without the fix.
    - When the change of the probe leaves an input that is part of the defect wrong, or makes an input that was right wrong, the fix is changed once more at the operation.
    - An other input still wrong after that second change is written in the record as not fixed, with its result.
    - The test case of an input not fixed is taken out of the test, and its failing run is quoted in the record, so the test asserts no known defect.
    - The Cause section and the session's final message name each input not fixed.
```

3. **Spec 2 and Standards 2 (Steps 19).** The two bullets under Steps 19's first line ("Each input that is part of the defect is green, ..." and "For a defect in text, ...") and its Done line become:

```
    - Each input that is part of the defect gives its right result, except an input written as not fixed.
    - Each input not part of the defect gives what it gave on the tree without the fix.
    - Each input of another defect is left out of the result.
    - For a defect in text, each other situation is read again against the text after the fix and quoted in place of a run.
    - Done when the test is green, the red command is green, the original case is green and each other input gives the result its class requires, each quoted in the record, with an input written as not fixed quoted with its result.
```

4. **Standards 4 (the glossary entry).** In `docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md`, the entry **other input** becomes, the same in both:

```
- **other input**: in a diagnosis, an input other than the reported one that reaches the operation that goes wrong. Its right result is the result the rule the operation breaks gives for it. In a defect in code it is run through the red command with that input in place of the reported one and the assertion set to its right result; in a defect in text it is read against the text. Each is put in one of three classes: part of the defect, not part of the defect, or another defect. Stated in: `diagnose`, Steps 15 to 19.
```

5. **Standards 5 and Behaviour 1 (the template).** In `skills/diagnose/templates/diagnosis.md`:
   - The Cause placeholder's "each input of the defect the fix does not cover, or "none"" becomes "each other input written as not fixed, or "none"".
   - The Probes table's Result cell becomes "<falsified, or still standing, with each other input its change broke>".
   - The "Operation and other inputs" table gets a column "Right result" after "Why it reaches the operation", with the cell "<the result the rule the operation breaks gives for this input>". The two result cells before the fix read "<right or wrong, with the red command's output with this input and the line that shows it>" and "<the same, with the change of the probe>". The "Result after the fix" cell reads "<its right result; or what it gave without the fix; or left out, for another defect; or not fixed, with its result>".

6. **Standards 3 (line 189).** Closed by item 1's text ("so its failure costs what the reported input's failure costs").

7. **Proof 1, Proof 2 and Behaviour 3 (the report).** In your report:
   - The "Item 7 of the verify list" part names every added or changed line of the diff over 20 words, counted with the bullet marker removed, each with why it keeps its form; the claim "Every changed bullet is one rule" stands only where it holds.
   - Case 1's reading is redone on the round's text, with the step-3 record's hypotheses named as that record numbers them, and the class of each agents folder not yet made (the same folder, and a different folder) read from the text's own words with the lines quoted.
   - "Host- or user-visible changes" names, with before and after: a probe's broken input recorded and one more probe for its hypothesis; the right result written per other input; the test case of an input not fixed taken out with its run quoted.

Not yours, closed by the orchestrator: Standards 1's caveat on line 166 is closed by item 1's probe bullets (the hypothesis stays "still standing" in its Probes row, item 5). The duplicate definition (Standards 4, second part) goes, by item 1.

Add a section "Repair round 1" to your report: each item above DONE or NOT DONE with the command or the lines that prove it; every check of the brief's "Verify before you report" rerun and quoted verbatim, the character-set check's line and exit status included; every case of the brief's "Cases" read again against the round's text with the deciding lines quoted; and the files changed in the round with line counts.

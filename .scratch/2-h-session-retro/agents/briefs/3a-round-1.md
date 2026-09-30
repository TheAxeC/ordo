# Round 1 of step 3a: the six rewordings the user ruled, and the rulings on the review's findings

The review is `.scratch/2-h-session-retro/agents/reviews/3a-refuter.md` in the main checkout. The user's ruling "Step 3a, six ruled sentences the brief check would reword" (option (a)) rewords six of the texts you placed. Work in the same worktree under the same brief and rules file. Make exactly these changes and no other. No git command that changes state. Each text is written exactly as given, one line per bullet, numbered item or paragraph, indented as its neighbours.

1. Rule 13, fourth bullet, in `docs/dev/change-standard.md` and in `skills/repo-setup/templates/docs/dev/change-standard.md` (rewording 1 of the ruling, and the review's note that "the test's failing line" could point at either failing line of the table). The sentence "The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour, and the report's table gives that change and the test's failing line; the reviewer checks it by reading the test and by a change of its own." becomes these two sentences:

   ```
   The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour and quoting the test's failing line with that change made, in the table the next bullet gives. The reviewer checks it by reading the test and by a change of its own on a scratch copy.
   ```

2. Rule 13, fifth bullet, in both copies (Standards 4: a case of a behaviour the change preserves has no failing line on the unchanged tree). After the sentence that ends "and the test's failing line with that change made." and before "The table covers those behaviours", one sentence is added:

   ```
   A case of a behaviour the change preserves has a row too, with its passing run on the unchanged tree in place of the failing line quoted for it.
   ```

3. `skills/spec/templates/brief.md`, "Cases", the second bullet (rewording 2, and Standards 6: an input the script accepts has no error line). The bullet becomes:

   ```
   - <for a code step (a script, or a product's code), each input the step's text implies but never states (a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path, and for a script its output closed by the program reading it before the script ends), with its expected result, for a script the exit status and, when the script refuses the input, the error line; only the inputs where a wrong answer costs something, as the rules file's rule on edges weighs them>.
   ```

4. `skills/spec/SKILL.md`, "Steps / The brief check" 2, the **Dictated text** bullet (rewording 3). Its third sentence leaves the bullet and becomes a sub-bullet under it, indented three spaces more:

   ```
      - **Dictated text.** Every text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints) is read against the rules file and the standards the configuration names, as the reviewer holds a diff to them. Each place a text breaks one is named, with the rule.
        - Each claim a dictated text makes about the tree is checked as a premise is.
   ```

   The fence above shows the two lines with the brief's own three-space list indent in front; in the file the first keeps the indent it has and the second has three spaces more than it.

5. `skills/spec/templates/brief.md`, "Report" (rewordings 4 and 5, and Standards 5: the sentences that "Verify before you report" 5 names had no part of the report). Parts 4 and 5 become the two lines below, a new part 7 is added after part 6, and the parts that were 7 to 11 become 8 to 12 with their words unchanged:

   ```
   4. For each case of a code step, the table the rules file's rule on tests asks for gives the small change "Cases" asks for and the test's failing line with it made.
   5. The DONE / NOT DONE table with the checks of "Verify before you report" and their output verbatim; a command that prints nothing is given with its exit status, and a long line is quoted whole, never shortened with "...".
   7. Each sentence that item 5 of "Verify before you report" names as longer than the standards allow, with its reason.
   ```

6. `skills/refute/SKILL.md`:
   - "The four headings", Standards, the bullet on a term of the glossary (rewording 6) becomes:

     ```
       - a term of the glossary the diff uses outside its entry's sense, or an entry the diff makes false, whether or not the report's terms part names it;
     ```

   - Steps 5 gains two sub-bullets (Standards 1 and 2: the reviewer's own change is a part of the check, as rule 13 says, and the step that makes it says how):

     ```
        - For each case of a code step, the reviewer checks that the case's test is a proof, as the rules file's rule on tests says: it reads the test, and it makes one change of its own that takes the case's behaviour out and runs the test against that change.
        - The change is made on a scratch copy of the files the test runs, copied with `cp` into a folder under `$TMPDIR`, never in the worktree or the main checkout, and the folder is removed before the report is written.
     ```

   - "The four headings", Proof, the last bullet becomes (the "or" that contradicted rule 13 is gone, and the bullet points at the step):

     ```
       - a test that would still pass with the behaviour it is written for taken out of the code (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs), found by reading it and by the reviewer's own change of Steps 5.
     ```

   - "Anti-patterns", the first cell of the row on the reviewer's edit (Standards 3: the row must keep the old limit) becomes "An edit to any file outside the reviewer's scratch copy, by the reviewer"; the row's other two cells stay.

7. The report, "The terms" (Proof 1): the list is completed with every glossary term the added or changed lines use, among them **worktree**, **step**, **orchestrator**, **ruling** and **landing**, each with the line that uses it and whether the use is in the sense its entry gives. Find them by reading the added lines of `git diff 7e3dbc2` against the glossary's headwords.

Rulings on the review's other points: Spec none and Behaviour none need nothing. The points under "Declined to judge" need no change in this round.

## Verify before you report

Run from the worktree's root, each must hold:

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md` ends `checks: 11 commands passed` and exits 0.
2. Each text this round dictates is in its file once, whole, checked as the brief's "Verify" 2 says (`grep -c -F -f <one-line file> <file>` prints 1; for items 1 and 2, in each of the two change standards). The texts the round replaces are gone: the same check prints 0 for the old sentence of item 1, the old parts 4 and 5 of "Report", the old Standards bullet, the old Proof bullet and the old row cell.
3. `git diff -U0` of each of the two change standards shows the same removed lines and the same added lines. `git diff --stat` shows the six files and no other outside the ledger.
4. `LC_ALL=C grep -n '[^ -~]'` over the six files prints nothing; its exit status is given.
5. `git grep -n "reviewer's own\|change of its own\|scratch copy" -- skills docs README.md utils`: each hit is read, and no two disagree on whether the reviewer's change is made, or on where.
6. Reading: "Report" of `brief.md` has twelve parts numbered 1 to 12 in order; the brief check still has eight checks and eight headings; each list of "The four headings" still ends with a period on its last bullet; Steps 5 of `refute` still ends on its completion criterion, the two sub-bullets under it.

## Report

Rewrite `.scratch/2-h-session-retro/agents/reviews/3a-report.md` whole, in the shape the brief gives, for the tree as it is after this round: the first line; the open items of the state file verbatim (the worktree's copy of the state file is the one at the step's base; write the open items as the main checkout's `.scratch/2-h-session-retro/orchestrator-state.md` holds them now); the cases' first read as it was; the DONE / NOT DONE table for the brief's items and checks as they now stand, and a second table "Round 1" with one row per item 1 to 7 above and per check 1 to 6, each output verbatim; the terms, complete; files with line counts; "Judgment calls"; the sentences longer than the prose standard allows, each with its reason, under a heading of their own; visible changes; anything wrong or impossible in this round's text, with the evidence; the rule 14 list. Your final message is the report's text.

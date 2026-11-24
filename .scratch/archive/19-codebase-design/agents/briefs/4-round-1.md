# Round 1 of step 4: the findings of the review, each with its ruling

Read `.scratch/19-codebase-design/agents/reviews/4-refuter.md` for the findings in full. Each ruling below says what to change. The brief `agents/briefs/4.md` and every rule of the first build still hold. Change nothing these rulings do not name. All changes are in `skills/code/codebase-design/SKILL.md`, "Steps / standards", unless a ruling names another place.

## Rulings

1. Finding F1, a default rule that differs from the repository's. Group 1 is every default rule for which the repository's pages hold a rule on the same requirement that asks something else, whether or not the two can both be followed: a different limit, a different order, a different check. Present is a rule that asks the same. The words of the stop for group 1 say that the two pages state the rule differently, and no longer that they contradict each other. With this, every default rule the pages have something on is either present or in group 1, and groups 2 to 4 hold only what the pages have nothing on.
2. Finding F2, a tool. The split is by requirement, and a sentence is not its unit. Each requirement of a default rule is sorted on its own. A requirement the code shows without the tool goes to present or to groups 1 to 4 like any other, even when its sentence names the tool or speaks of it by a pronoun. Only what cannot be met without the tool goes to group 5: that the tool runs, its configuration file, and a requirement that only the tool can check. The line of group 5 names the tools.
3. Findings F3 and F4, a new page. The stop does not print a new page. Each new page takes one line, lettered after the differences of group 1, with one yes or no of its own: the page's subject, the path it would be written at, how many rules it would hold, and those rules named by their titles or opening words. The prose standard, copied as it is, takes the same one line and says that it is the default page unchanged. The drafted text of each new page is written to a file beside the audit file, in the same temporary folder, and the line gives that file's absolute path for a user who wants to read the page first. A rule of groups 2 and 3 that belongs to a new page is decided by that page's yes or no and by nothing else: the yes or no of group 2 and the numbers of group 3 cover only rules added to pages that exist. A rule of group 4 that belongs to a new page stays a numbered line of group 4 and enters the page when the user names it. Steps / standards 11 says the same, so no two of its bullets disagree on a rule of a new page. The made-up example gains one such line.
4. Finding F5, what one rule is. One rule is one numbered item, one bullet, or one paragraph or block outside any list that states a requirement, such as a section that gives the commands to run.
5. Finding F6, the example. The default's quote in the example of group 1 is replaced by a made-up default sentence that asks something else than the repository's on the same requirement, namely that the whole list runs once at landing and the builder runs only the checks of the files the step changes. The text says that each quote is the sentence or sentences that differ, never a whole item of several sentences.
6. Finding F7. The sentence on other pages of rules is shown only when Steps / standards 3 noted such a page, and says that those pages were not compared.
7. Finding F9. Steps / standards 10 is done when the user has answered or corrected the draft. A choice, a yes or no, or a question the user left unanswered counts as no: nothing is written for it, and the last message names it. Steps / standards 11 says the same for a difference of group 1 left without a choice.
8. Findings B1 and B2. The report's list of user-visible changes gains two rows with before and after: the `review` mode now takes a language's page as lacking by the definition of "What it reads" 4, and the stop names the pages of rules that were not compared.
9. The description, the README row, the Stops row "The draft", the anti-pattern row, ADR 0047's sentence and the figure's note are reread after rulings 1 to 7 and changed wherever one of them is no longer true.

Not sent: F8, P1, P2, S1 and S2 need no change. S3 is the orchestrator's: step 5 lands before step 4.

## Verify before you report

Run every check of the brief's "Verify before you report" again. Read cases 1 to 12 again on the text as it now stands, with these added:

13. A repository whose page says a source file stays under 1,500 lines, where the default says under 1,000. Expected: group 1, both sentences quoted, the user chooses.
14. A default bullet "An accessor is `[[nodiscard]]`, and a linter warns on one without it", in a repository without that linter whose code marks 40 of 44 accessors. Expected: the `[[nodiscard]]` requirement as a line of group 3 with its count; the linter named in the line of group 5. The numbers are made up.
15. A repository that lacks only the prose standard. Expected: a stop of a few lines with one lettered line for the page and its yes or no; the page's text is not printed.
16. A repository that lacks a language's page, where the user answers no to the rules on how work is done and yes to the new page. Expected: the page is written with every rule it was shown to hold; no rule of an existing page from group 2 is written.

## Report

Append to `.scratch/19-codebase-design/agents/reviews/4-report.md` in the worktree a section "Round 1" with: anything NOT done first; one row per ruling with where the change stands; the checks' output as printed; cases 1 to 16 read on the new text; the stop for the made-up repository of the example, written out in full; every judgment call the rulings left open. End with that section as your final message.

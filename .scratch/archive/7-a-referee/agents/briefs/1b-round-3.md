# Repair round 3 of step 1b

The review over round 2 named ten findings. Read them in full in `/Users/axelfaes/workspace/ordo/.scratch/7-a-referee/agents/reviews/1b-refuter.md`, section "Repair round 2, refuted", then close each one in the worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/7-a-referee-1b`, which holds your round 2 as you left it. The brief, round 2 and the same rules hold. Word the pages yourself.

## What to close

1. Behaviour 1, the referee can work out the budget. After the cut, the referee is never given `selection.md` as the session then holds it. For the minor points in full and for the report it is given a file the session writes, which holds the selected points only: no section of points over the budget, no found counts, no count line. Where a call needs the referee to write into the selection, say which file it writes and how the session carries that text back. The rule check of the report is given the same file and not the cut selection. No call to any agent before the report is written lets it read that a cut was made or how many points it moved. State in the page what the referee can still infer, if anything, and why it cannot change a grade or a length by it.
2. Proof 1, parts of the selection reach the user unchecked. Everything the referee writes into the selection after the first rule check (the minor points in full, and each rewrite after a change of the user) is read by the rule check before the user is shown it or before the report is written from it.
3. Behaviour 3, a new point is checked by nobody. A new point of `new-points.md` is read against the rules of `agents/new_issue_agent.md` by a rule check before the session adds it to the selection, with the same returns as the other rule checks.
4. Behaviour 2. "You select no point and leave no point out" and the second round's left-out unanswered point may not contradict: one of the two is reworded so that both hold in both rounds.
5. Behaviour 6. One order for a new point, the same in the selection, in the report, in the template and in `second_round.md`. Round 2's case R11 expects it first among the major points.
6. Behaviour 4. A first-round point the revision made worse has one place where the EIC writes the added defect so that the new-issue agent can judge it, and the rule on what `new-issues.md` holds agrees with the new-issue agent's first condition.
7. Behaviour 5. When all five reviewers review the revision, no comment of theirs that is a new issue reaches the referee before its selection is done: say which agent reads the five reports for new issues, and what the referee is given of them.
8. Spec 1. No page an agent is given points at a page that agent is not given. What the referee and the rule check must know about the sections the session writes stands in a page they are given.
9. Behaviour 7. The found counts and the count line add up in a second round with a new point and with the session's left-out entries: say who counts what, and where.
10. Standards 1. One rule per bullet in the bullets the finding names, and in any other bullet of the seven files that joins two rules.

Then read the seven files once more as each agent in turn, with only the files that agent is given, and close every other contradiction between two rules and every pointer to a page the reader does not have. A contradiction left standing is a finding.

## Cases

R1 to R13 of round 2 again, and:

- R14. The referee finds nine major points, the budget is 7. Expected: no file and no prompt given to the referee or to a rule check before the report is written shows that two points were cut.
- R15. A minor point written in full after the cut holds a sentence that argues for an exception. Expected: a rule check names it before the user sees it.
- R16. The new-issue agent returns a new point whose "Why it is major" names no main claim. Expected: a rule check names the break before the point enters the selection.
- R17. Second round, all five reviewers run, one writes a comment on a defect the revision introduced. Expected: the referee's inputs for its selection do not hold that comment, and the comment is judged against the two conditions.

Note the first read of R14 to R17 on the worktree as it stands before any change.

## Paths, checks and report

The paths of round 2. The five checks of round 2's "Verify before you report" again, with the description still within 1,024 characters. Add a section "Repair round 3" to your report: first line anything NOT done or that every item is done; the first read of R14 to R17; one entry per item 1 to 10 with the page and section; the checks with their output; every judgment call left open; every user-visible change with before and after. Correct in place each earlier line the round makes out of date.

Run no git command that changes state, start no agent, invoke no skill, make no outside lookup, never break a file to see a check fail. A shortcut is a finding.

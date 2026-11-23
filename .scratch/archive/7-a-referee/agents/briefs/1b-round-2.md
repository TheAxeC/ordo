# Repair round 2 of step 1b

Two runs of the landed skill showed three failures, and the user ruled on each. This round changes the design so that the agent that writes is not given what it misused. Work in the worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/7-a-referee-1b`, a fresh worktree at main's head, under the brief `.scratch/7-a-referee/agents/briefs/1b.md` and the same rules file and standards, which you read again in full. The skill as it stands in the worktree is what landed, with seven small changes made at the landing: read all five files again before you change anything.

## What the runs showed

- A first round under a budget of 7 major points wrote "Major points the paper has: 7", and two of the seven were weaknesses of wording or of a missing detail graded major with the reason that a claim "cannot be judged".
- The two reports had 1,189 and 1,195 words under a limit of 1,200.
- A second round listed the EIC's one new issue under a first-round point, with a written argument that the first-round point had asked for it, though the page forbids that. It kept as points three first-round points the authors had not answered. It recommended major revision on that one merged point.

## The user's rulings (each word for word in `plan.md`, "Rulings")

- Open item 4 (a): the referee never sees the budget or the word limit. The session cuts from the referee's ranking and checks the length afterwards; only a report over the limit goes back to be shortened.
- Open item 5 (a): in a second round, a first-round point the authors left unanswered is let go, to the left-out list where the user can move it back in, unless a main claim still fails without it.
- Open item 6 (d): the referee is not given the EIC's new issues, which a fresh agent judges on their own. Every rule of the referee's pages is absolute: an agent that disagrees with a rule follows it and writes its objection for the user. A fresh agent checks the selection and the report against the rules before the user sees them, and an argument for an exception counts as a break.
- Rules are rules: an agent never reasons its way past a rule.

## What to build

Word the pages yourself; nothing below is dictated text. Each item is judged on its own.

### The numbers stay with the session (Open item 4)

1. No file and no prompt the referee is given holds the most major points, the most minor points, the length in words or the journal's length limit, at any call before the report is written. `intake.md` holds what the referee may read: the direction, the severity, the journal's fields and the values of its recommendation. The session keeps the four numbers and writes them to a file of the run folder only when the run ends, with what the cut and the length check did.
2. The referee's selection finds, grades and ranks every point, and writes how many major and minor points the paper has. It selects nothing and cuts nothing. `agents/referee_agent.md` has no sentence left that tells the referee to apply, respect or know a budget, and its section "The budget" goes or is rewritten for the session's side in `SKILL.md`.
3. The session applies the cut after the referee's selection: the major points over the most major points, counted from the bottom of the referee's ranking, move to "Points over the budget", and the same for the minor points. This is a move of whole entries in rank order and nothing else; the session changes no grade, no rank and no text of a point.
4. So that the work on points that are cut stays bounded: the referee writes every major point in full, and every minor point in one line with its merged comments. After the cut, the session resumes the referee to write the selected minor points in full, each with its passage read in the manuscript, naming those points and giving no number.
5. The report is written with no length given. The session then counts its words. A report within the shorter of the budget's length and the journal's limit stands. A report over it goes back to the referee once, with the number of words to stay within.
6. The stop "The selection" still shows the user the found counts beside the budget, the selected points, the points over the budget and the left-out comments. The intake still asks the budget with the same defaults.
7. The grade test loses its loose clause. A point is major only when a main claim of the paper fails on the evidence given, or has no evidence at all, unless the point is settled; the line "Why it is major" names that claim and says which of the two it is. A claim that is worded too strongly for evidence it has, and a detail the reader needs to repeat or check a result, are minor.

### An unanswered first-round point (Open item 5)

8. In a second round, a first-round point for which the response letter gives no answer and the revision changed nothing is a left-out comment, with a reason that says the authors did not answer it, unless a main claim of the revised paper still fails without it, in which case it is a remaining major point. The report's general comments do not list the points let go. The user sees them among the left-out comments at the stop and may move one in.

### New issues, absolute rules and the check (Open item 6, Rules are rules)

9. The EIC writes the first-round part of its check and the rest in two files of the run folder: the check of the first-round points, and the new issues with the other observations. The referee is given the first file only, and no path to the second.
10. When the EIC wrote one new issue or more, the session starts a fresh agent that judges each new issue against the two conditions of "New points" and nothing else. It is given the revised manuscript, the response letter and the file of new issues, and neither the first-round check nor the referee's files. A new issue that meets both conditions comes back as a new point written in the form of the selection template; every other one comes back as a left-out comment with its reason. The session adds what comes back to `selection.md` after the referee's selection: a new point ranks first among the major points, and is never listed under another point. With no new issue, the agent is not started. The agent has a page of its own under `agents/`.
11. Every rule of the pages an agent of this skill reads holds whatever the reasons. Each such page says so once, near its top, and says what an agent does that thinks a rule gives a wrong result here: it follows the rule and writes its objection in a section of its output that the user is shown (for the referee, a section of `selection.md` shown at the stop "The selection"). No sentence of the pages offers an exception by judgment where a rule is meant; a rule that needs a judgment says who makes it and on what.
12. A fresh agent, the rule check, reads `selection.md` before the stop "The selection" and `referee-report.md` before the run ends, each against the rules of the referee's pages for that file. It is given no budget number and no length. It names each break with the rule and the place. A sentence in the file that argues for an exception to a rule is a break. A major point whose "Why it is major" does not name a main claim that fails or has no evidence is a break. With a break, the session resumes the referee with the breaks named, and the rule check reads the corrected file again. After two such returns, breaks that are left are shown to the user at the stop, as a row of the Stops table. The rule check has a page of its own under `agents/`.
13. Every place outside the five files that names the skill's agents, its sequence or its stops is brought in line in this round: `README.md` (the row of `referee`, the sentence on the skills that launch agents, the alt text of the figure), `docs/figures/gen_figures.py`, function `referee()`, with `docs/figures/referee.svg` written again by `python3 docs/figures/gen_figures.py`, and `docs/glossary.md`, `docs/dev/building.md` and `docs/dev/scripts.md` where a sentence of theirs becomes false. `skills/academic/paper-review-panel/` is not changed.
14. `metadata.version` stays "1.0.0". Reread each sentence of the skill that describes a file, a round or a call as a whole, and change the ones this round makes false, the description included, within its 1,024 characters.

## Cases

Each is checked by reading the pages as the session, the referee, the EIC, the agent of item 10 and the rule check would follow them.

- R1. The session's prompt to the referee for the selection, and every file that prompt names. Expected: none holds the most major points, the most minor points or a length.
- R2. The referee finds five major points; the budget is 7. Expected: five selected, none moved, and no step at which the referee could have learnt the 7.
- R3. The referee finds nine major points; the budget is 7. Expected: the session moves ranks 8 and 9 to "Points over the budget", with their text as the referee wrote it.
- R4. The report has 900 words; the limit is 1,200. Expected: it stands, and the referee was never told 1,200.
- R5. The report has 1,500 words; the limit is 1,200. Expected: one return to the referee, with 1,200 named.
- R6. A weakness: the abstract says "consistently outperformed" where the Results give a mixed outcome. Expected: minor.
- R7. A weakness: the title claims a property for which the manuscript reports no test of any kind. Expected: major, and "Why it is major" names the claim and that it has no evidence.
- R8. Second round: the response letter says nothing on a first-round minor point and the revision did not touch it. Expected: a left-out comment with that reason, and no line of the report.
- R9. Second round: the same for a first-round major point under which a main claim of the revised paper still fails. Expected: a remaining major point.
- R10. Second round: the EIC writes one new issue that fails the second condition. Expected: the referee's inputs do not hold it, the agent of item 10 returns it as a left-out comment, and no point of `selection.md` holds it.
- R11. Second round: the EIC writes one new issue that meets both conditions. Expected: one new point, ranked first among the major points, under no other point.
- R12. The referee writes in `selection.md` that a comment is listed under a point "because the point had asked for it", where a rule forbids the listing. Expected: the rule check names the break, and the file goes back before the user sees it.
- R13. The referee thinks the grade rule makes a point minor that it would call major. Expected: the point is minor, and the objection stands in the section the user is shown.

Before any change, note for each case what the pages in the worktree give now.

## Paths this round writes

- the five files of `skills/academic/referee/`, and two new pages under `skills/academic/referee/agents/`
- `README.md`, `docs/figures/gen_figures.py`, `docs/figures/referee.svg`
- `docs/glossary.md`, `docs/dev/building.md`, `docs/dev/scripts.md`, each only where a sentence becomes false
- `.scratch/7-a-referee/agents/reviews/1b-report.md` in the worktree

No script is written other than the change to `docs/figures/gen_figures.py`, which stays ASCII with no unicode.

## Verify before you report

From the worktree's root:

1. The ASCII check of the brief's "Verify before you report" 1, over every file this round changes or adds.
2. `sed -n 5p skills/academic/referee/SKILL.md` prints `  version: "1.0.0"`.
3. `python3 docs/figures/gen_figures.py` exits 0, and `git status --short docs/figures` then shows only `gen_figures.py` and `referee.svg` changed.
4. `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.
5. `grep -n -i 'budget\|words\|length' skills/academic/referee/agents/referee_agent.md` is quoted whole, and each line it prints is read: none gives the referee a number or tells it to stay within one before the report is written.

## Report

Add a section "Repair round 2" to your report: its first line says anything NOT done, or that every item is done; then the first read of R1 to R13; one entry per item 1 to 14 with the page and section that carries it; the checks above with their output; the line counts; each name the round adds or changes with its `grep -rn` across `skills/`, `utils/`, `docs/` and `README.md`; every judgment call the round left open; every user-visible change with its before and after; and anything in this round's text that was wrong or impossible, with the evidence. Correct in place each line of the report above that this round makes out of date.

Run no git command that changes state, start no agent, invoke no skill, and never break a file to see a check fail. A shortcut is a finding: every item is done in full or named NOT DONE.

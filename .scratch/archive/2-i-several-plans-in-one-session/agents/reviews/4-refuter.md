# Step 4 refuter report (on .agents/worktrees/2-i-several-plans-in-one-session-4, base 27a5a26)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number. A ledger file and a transcript entry keep their line.

## Verification (rerun by the reviewer)

```
# Brief, "Verify before you report", from Ordo's root
$ git ls-files -coz --exclude-standard -- .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run .scratch/2-i-several-plans-in-one-session/agents/reviews/4-report.md | xargs -0 perl -CSD -ne '<the check of docs/dev/building.md>'; echo "exit $?"
exit 0
$ (same git ls-files) | tr '\0' '\n' | wc -l
      40
$ find .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run -type f ! -name '*.txt.md' ! -name git-log.txt ! -name report.md; echo "exit $?"
exit 0
$ grep -rn 'PASS: docs/guide.md' .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run | wc -l
      47
  among them: .../4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md:89:  - `PASS: docs/guide.md`   (booking of plan 3's step 3)
$ git -C ~/.local/share/ordo-stable log --oneline -1
61d3eab Land step 3 of plan 2.I, the skill texts after the real run
$ git -C ~/.local/share/ordo-stable describe --tags
v6.0.0-rc.2
$ printenv CLAUDE_CODE_EFFORT_LEVEL; echo $?
1
Check 5 (read): see Standards 1.

# The step's worktree
$ cd .agents/worktrees/2-i-several-plans-in-one-session-4 && git diff 27a5a26 --stat; git status --short
(nothing; both exit 0)

# The copies
cmp of every file under 4-run/.scratch/ (32 files) against <scratch>/.scratch/<path without .txt.md>: all equal; no file of <scratch>/.scratch lacks a copy.
cmp 4-run/building.md.txt.md docs/dev/building.md: equal
cmp 4-run/roadmap.md.txt.md docs/roadmap.md: equal
cmp 4-run/run-notes.txt.md ../2i-run-2-notes.md: equal
cmp 4-run/report.md run-report.md: equal
git log --format='%h %ad %s' --date=iso-strict --name-status | tr '\t' ' ' | cmp - 4-run/git-log.txt: equal
diff 4-run/roadmap-done-{3,5}.diff.txt.md ../roadmap-done-{3,5}.diff: differ only in lines 1-2, a tab written as a space (as the report's judgment calls say)
wc -l of every 4-run file against the report's "Files" list: equal

# Scratch repository, read-only git
dispatch blocks per commit (git show <c>:<state file>), 3=[...] 5=[...]:
4bfa048 3=[none] 5=[1:preparing]; c540ae3 3=[none] 5=[1:not-started]; 23e472f 3=[2:preparing] 5=[1:not-started]; 150e6e8 3=[2:not-started] 5=[1:not-started]; 37845b0 3=[2:not-started] 5=[none]; c59dbea 3=[none] 5=[none]; b7d8bd2 3=[1:preparing] 5=[none]; bb47d79 3=[1:not-started] 5=[none]; 52682d0 3=[1:not-started] 5=[2:preparing]; 7dbe29a 3=[1:not-started] 5=[2:not-started]; cf5c5b6 3=[none] 5=[2:not-started]; 9f0858e 3=[none] 5=[2:not-started]; 8439f8f, b72a3a5, 0cc18f5 both none; c1b3023 3=[3:preparing]; d599ab7 3=[3:not-started]; 6379a69, 141a975, 82ced80 both none
$ ls .scratch/choices.md
ls: .scratch/choices.md: No such file or directory
$ python3 ~/.claude-backup/skills/plan-orchestration/templates/plan_cost.py .scratch/<plan> | diff - .scratch/<plan>/agents/reviews/closing.md
(no difference, both plans)

# Transcript (python3 over the jsonl, fields only)
Skill calls 20:53:35 to 21:28:44: 21, in the order the report's row 10 lists.
Agent calls in the run: 12, all ordo-high, model sonnet; first/last timestamps of each subagents/agent-<id>.jsonl equal the timeline table row by row; served model claude-sonnet-5-5 in every one.
No tool_use named AskUserQuestion from 20:53:30 to 21:33:00; user-side messages are skill loads, hand-backs and two compaction summaries (20:56:02, 21:14:58).
Completion notices' usage: a5daed 8 tool uses, a9ee783 9, a8a41fe 9, affe0b4 16, a3df69c 16, ab949a5 10, brief check a3a6121 16.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. First /spec is Skill `spec 5 1` at 20:55:10; plan 3 opened first (41b86f4, 20:54:40).
- 2: holds. Launch commits c540ae3 (20:57:29) and 150e6e8 (20:58:41) precede the first landing 37845b0 (21:00:51).
- 3: holds. Pick at 20:57:40 (run notes line 7) judged the pair a dependency that forces an order; Skill `spec 3 1` at 21:03:20, after 37845b0.
- 4: holds. Plan 5's `preparing` entry written at 21:01:27 (transcript line 31172) while plan 3's step 2 entry stood until c59dbea at 21:03:11.
- 5: violated, Proof 1. The limit was never exceeded, but the run notes record no pick after the landings of plan 5's step 2 and plan 3's step 3.
- 6: holds. No Skill call and no commit falls between any /land call and its landing commit; the five landings follow the order of their last review's end.
- 7: holds. Holds at 21:08:47 (run notes line 44); `spec 3 3` at 21:21:57 after 8439f8f; brief 3 line 15 names the rewrite; booking line 89 quotes the PASS line.
- 8: holds. `report.md` lines 3 and 7 are in the closing form of "Reports"; the open items equal the state files' lines.
- 9: holds. No question to the user; no open item outside the six kinds; both plans opened without the stop.
- 10: holds. 21 Skill calls, one per invocation of /plan, /plan-orchestration, /spec, /refute, /land and /roadmap. No plan skill's work was found done without its call. The pin reads 61d3eab before the run (run notes line 1) and now.
- 11: holds through this review, run with the scratch repository in place.

Cases of the brief's "Cases":

- First /spec is plan 5's step 1: met, transcript line 30822.
- Plan 3's step 1 waits, judged at the pick, prepared after 37845b0: met, run notes line 7 and `spec 3 1` at 21:03:20.
- Plan 3's step 2 beside plan 5's step 1, two steps in flight equal to the limit: met, commit 150e6e8 dispatch blocks.
- Plan 5's step 2 takes the freed slot, `preparing` while plan 3's step 2 is unlanded: met, transcript lines 31172 and 31233.
- Verify list rewritten by plan 3's first /spec after 8439f8f, PASS line booked, no /spec of plan 3's step 3 before: met.
- Every landing in verification order, none held back: met. The 72 s between the end of plan 3's step 1 review and `/land 3 1` went to finishing the resumed `/spec 5 2`. Under "Two steps in flight", other skills may run only while a /spec waits.
- Both plans at their closings with the report's position lines and open items: met.
- No open item outside the six kinds, no question: met.

## 1. Spec

- 4-report.md, "The cases' first run": "No such reading was written before `/plan` was invoked". The brief's first task is a first run of every case before the run. The report gives readings made afterwards and marks this NOT DONE, which matches the transcript: no case reading between 20:51:43 and 20:53:35. Failure scenario: a case the brief got wrong would have been found only after the run had spent its agents. Verdict: none (every case is met by the record), already NOT DONE in the report.
- Brief, "What to build", "The run": "with `git rev-parse --show-toplevel` run first in the same Bash call that sets the working directory". Of the 92 Bash calls that cd into the scratch repository, 11 carry it, and none after 20:56:06, right after the first compaction. The other 81 include every landing and commit. The report does not mention this. Failure scenario: a call whose cd lands in a directory without its own .git runs git against the enclosing repository with no printed path to catch it. In this run every cd was absolute and chained with &&, so nothing went wrong. Verdict: none on the numbered conditions; a requirement of "The run" not met and not reported.

## 2. Proof

- 4-report.md, row 5 and "Steps in flight": "the count read at each pick and preflight is 0, 1 or 2" and "On disk the count agrees with the count read at each pick and preflight". The run notes have no pick line after the landing of plan 5's step 2 (8439f8f). That pick took plan 5's closing and plan 3's step 3, and the next line is the `/spec 3 3` preflight at 21:22:11. The notes also have no pick line after the landing of plan 3's step 3 (6379a69). The table lists neither pick. Condition 5 and the record's "one line per pick" both rest on this. The counts can be rebuilt as 0 from 8439f8f's and 6379a69's dispatch blocks, but the run notes cannot be rewritten. Failure scenario: a reader auditing the limit at every pick finds two picks with no count and no pair judgment, among them the pick that gave plan 3's step 3 its slot. Verdict: item 5 violated.
- 4-report.md, "Findings of the run" 3: "Two reviewers wrote figures that differ from their completion notices". Each reviewer's own usage line, in the raw hand-backs before they were saved, differs from its notice in tool uses:
  - a5daed: 9 against 8;
  - a9ee783: 11 against 9;
  - a8a41fe: 11 against 9;
  - affe0b4: 15 against 16;
  - a3df69c: 9 against 16;
  - ab949a5 gave 10, which matches its notice, but no id or tokens.
  
  So the finding understates how widespread the defect is. The decision resting on it is the scope of the text change that follows from `refute` Steps 6, which has the reviewer write its usage line, while `spec` "The brief check" 3 has the session fill it. Failure scenario: the change is made as a fix for two agents' slips rather than for a reviewer that cannot know its own figures.
- 4-report.md, "Findings of the run" 4: "The reviewer ab949a5723e4a311d ran `git log --oneline -3` and `git rev-parse HEAD`". Five of the six reviewers ran git beyond `git diff <base>` and `git status --short`, against their prompts and `refute` "What it reads" 5:
  - a5daed: log, rev-parse;
  - a9ee783: log, show, cat-file, ls-files;
  - a8a41fe: log, show;
  - affe0b4: log, ls-files, stash list;
  - ab949a5: log, rev-parse.
  
  All of these were read-only. The decision resting on it is whether the reviewer's git allowance is a text defect or one agent's slip. Failure scenario: the later entry treats a defect that recurred across reviewers as a one-off and leaves the text alone.

## 3. Standards

- 4-report.md, throughout, against `prose-standard.md` B and E. Check 5 says the report "was read against the prose standard's rules on list items and sentence length". Its running prose (about 1320 words, tables and code excluded) holds 13 semicolons, where B allows 2 per 1000 words. It also holds 13 sentences over 30 words, for example line 220 (66 words, two semicolons), line 121 (52 words) and line 71 (49 words, three semicolons). Line 220 also joins two rules in one bullet, against `skill-layout.md` "Lists and tables". Failure scenario: a reader of the landing booking takes check 5 as passed when the prose breaks the rules it names. Verdict: none on the numbered conditions; verify check 5 is not met as claimed.

## 4. Behaviour

- `/land 5 2`, run notes at 21:19:33 and plan 5's booking of step 2: "verify list rewritten to the two commands of docs/dev/building.md as the cherry-pick brings it". The `land` text is not silent here, although the report's finding 1 says it is:
  - Steps 2 compares before Steps 4 cherry-picks, against the page "What it reads" 8 reads on main, which then held one command.
  - ADR 0010's Consequences say "A landing is held to the checks main holds at that moment."
  
  The run followed an order the texts do not give, against the brief's "gives no order they do not give", and the report presents it as a gap. Which order is better is the user's call (Declined to judge). Failure scenario: a later entry changes `land` to compare with the cherry-picked page, as the report's framing invites, without weighing ADR 0010 against it.
- Builder prompts and `plan-orchestration` Steps 4: "Run no git command that changes state ... `git status` and `git diff` to read are fine". This is the wording of the four builder prompts from 20:57:20 to 21:07:52. `plan-orchestration` Steps 4 says "The builder. It never runs a git command." The scratch state file's standing demands say "the builder runs no git command". The scratch change standard, copied from Ordo's template "Where the work happens", allows reading with git status, diff and show. The two texts disagree, and the orchestrator followed one for four builders and the other ("Run no git command of any kind") for the fifth. Builders afc9aa3, aa0e9d4, a115b0d and a7ac822 ran git status and git diff, and a7ac822 also ran git log and ls-files. The report names neither the conflict nor the runs. Failure scenario: builders under one plan get different git rules depending on which text the orchestrator copies.
- The scratch landing reports, line 3 of each, for example "Entry 3, the guide's usage line and its FAQ; step 1 of 4, the usage sentence; next: step 3, ...". `land` Steps 11 opens the landing report with its plan's position line. `plan-orchestration` "Reports" gives that line as "Roadmap entry <n> (<title>). Plan step <k> of <m>: <step name>. Next: step <k+1>, <step name>." None of the five landing reports uses that form, and the report does not name it. Failure scenario: a reader or a script-free resume looking for the position line by its form finds none in any landing report.
- `report.md` against `plan-orchestration` "Reports", last bullet: "Then anything NOT DONE first, then the DONE / NOT DONE ledger naming the command that proves each row." The run's one report has neither. The bullet does not say whether it belongs to the orchestrator's report or the landing report. The report does not name this as a place where the text is unclear. Failure scenario: an orchestrator's final report omits the NOT DONE line, and a reader cannot tell from it whether either closing is unfinished beyond its roadmap diff.

## Declined to judge

- Whether `/land` should compare against the page on main before the cherry-pick or against the page as the cherry-pick brings it. ADR 0010 states the first, and changing it is the user's call.
- Whether one rulings bullet ending "(the user)." may carry step lines marked `(approved)` whose check wording the bullet itself names as the orchestrator's (brief Decision 2, ADR 0004). That is the user's call; the brief check raised it and the brief chose this form.
- Whether a closing step marked "orchestrator, no agent" should go through /spec and take a slot (report finding 5). The texts are silent, and choosing a reading is the user's call.
- Report findings 1 and 2 against the installed texts: finding 2 is true (neither `refute` nor its template asks for an ASCII report). Finding 1 is judged under Behaviour 1.
- The run notes' times are the orchestrator's own `date -u` stamps. They were checked against the transcript for every landing, pick and preflight, and not otherwise.

Reviewer usage: a6c40dff28725d6f6, claude-opus-5-5, 343444 tokens, 75 tool uses, 15 min 23 s

## Repair round 1, refuted

```
# Brief, "Verify before you report", from Ordo's root (/Users/axelfaes/workspace/ordo), after the round
$ git ls-files -coz --exclude-standard -- .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run .scratch/2-i-several-plans-in-one-session/agents/reviews/4-report.md | xargs -0 perl -CSD -ne '<the check of docs/dev/building.md, as written in that file>'; echo "exit $?"
exit 0
$ (same git ls-files) | tr '\0' '\n' | wc -l
      40
$ find .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run -type f ! -name '*.txt.md' ! -name git-log.txt ! -name report.md; echo "exit $?"
exit 0
$ grep -rn 'PASS: docs/guide.md' .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run | wc -l
      47
  among them: .../4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md:89:  - `PASS: docs/guide.md`
$ git -C ~/.local/share/ordo-stable log --oneline -1
61d3eab Land step 3 of plan 2.I, the skill texts after the real run
$ git -C ~/.local/share/ordo-stable describe --tags
v6.0.0-rc.2
$ printenv CLAUDE_CODE_EFFORT_LEVEL; echo "env $?"
env 1
Check 5 (read, reported under Standards): semicolons in the report's running prose and tables 3, all inside a code span (line 66) or a quotation (line 265, twice); sentences over 30 words 0 (longest 27); sentences of 21 to 27 words 17; table-cell sentences over 20 words 0. Before the round: 14 semicolons, 16 sentences over 30 words, 11 table-cell sentences over 20 words.

# The round's delta and the record
$ git diff f118104 --stat -- .scratch/2-i-several-plans-in-one-session/
 .../agents/reviews/4-report.md | 165 +++++++++++++++------
 1 file changed, 119 insertions(+), 46 deletions(-)
$ git diff f118104 --stat -- .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run ; git status --short -- .../4-run
(nothing: the record is unchanged since f118104; no uncommitted change under it)
$ cd .agents/worktrees/2-i-several-plans-in-one-session-4 && git diff 27a5a26 --stat; git status --short
(nothing)
wc -l of each of the 39 files the report's "Files" list names against the file: no difference; find 4-run -type f | wc -l prints 39.

# Scratch repository (read-only git, python3 over the transcripts)
git show <c>:<state file> for both plans at 4bfa048 c540ae3 23e472f 150e6e8 37845b0 c59dbea b7d8bd2 bb47d79 52682d0 7dbe29a cf5c5b6 9f0858e 8439f8f c1b3023 d599ab7 6379a69: every dispatch block and count equals the report's commit table; 8439f8f and 6379a69 hold no entry in either plan (count 0), as the two "rebuilt" rows say.
run-notes.txt.md: no pick line follows line 54 (landing 8439f8f) or line 64 (landing 6379a69); lines 55 and 65 begin the closings.
Bash calls in this session's transcript, 2026-10-12 20:53:00 to 21:30:00 UTC, first && segment holds a cd into 2i-run-2: 84; those holding "rev-parse --show-toplevel": 8, the last at 20:56:06. Every cd target is absolute or a variable, each chained with &&.
Same window, any cd into 2i-run-2 anywhere in the call: 92 calls, 8 with show-toplevel. "show-toplevel" over the session from 20:40: 11 calls, two of them at 20:52:43 and 20:52:53, before the run's first Skill call.
Skill calls: 21 from 20:53:35 (plan 3 --ruling) to 21:28:44 (roadmap done 3), in the order of the report's list; the 22nd, refute 2.I 4, is at 21:33:01. AskUserQuestion calls after 20:53: 0. Agent calls in the run: 12, all ordo-high, model sonnet; first and last timestamps of each subagents/agent-<id>.jsonl, and the served model claude-sonnet-5-5, equal the timeline table row by row.
Reviewers' own usage lines (SubagentHandback text) against the completion notices in the session: a5daed 9 / 8, a9ee783 11 / 9, a8a41fe 11 / 9, affe0b4 15 / 16, a3df69c "9 tool uses, about 8 minutes" / 16 and 108203 ms, ab949a5 "claude-sonnet-5-5, 10 tool uses" / 10: all equal to the report's finding 3.
Reviewers' git commands, from each transcript: a5daed log, rev-parse; a9ee783 log, show, cat-file, ls-files; a8a41fe log, show; affe0b4 log, ls-files, stash list; ab949a5 log, rev-parse; a3df69c status, diff only: all equal to the report's finding 4.
Builders' git commands, from each transcript: afc9aa3 status, diff --stat; aa0e9d4 status --short three times and nothing else; a115b0d status, diff --stat; a7ac822 status, log, diff, ls-files; a762551 none. Prompts of the first four hold "`git status` and `git diff` to read are fine"; the fifth holds "Run no git command of any kind."
Quotes: land "What it reads" 8 and Steps 2 and 4, ADR 0010 Consequences ("A landing is held to the checks main holds at that moment."), plan-orchestration Steps 4 ("The builder. It never runs a git command."), "Reports" (position line form, closing form, last bullet), the scratch and the template change standard "Where the work happens", roadmap 2.K goal: all present as the report quotes them.
Landing reports line 3 of the five scratch landings: "Entry <n>, <title>; step <k> of <m>, <name>; next: ..." in all five.
grep -c -i 'not done' 4-run/report.md prints 0.
```

### Verdicts

Round brief items 1 to 9:

- 1: done in substance. The report puts the requirement among the three NOT DONE items on its first lines. Its counts (84 calls, 8 with the check, none after 20:56:06) reproduce under the rule it states. The brief's "11 of the 92" does not reproduce (see Proof 2); the report keeps it as the earlier reviewer's figure.
- 2: done. Row 5 reads "DONE for the limit, NOT DONE for the record". Lines 7 and 14 say the notes lack the two picks. The counts table has the two rows marked "rebuilt", 0 each, equal to the dispatch blocks of 8439f8f and 6379a69.
- 3: done. All six pairs and the 108 s against about 8 minutes reproduce. The defect is placed in `refute` Steps 6 against `spec` "The brief check" 3 (both texts say what the report says).
- 4: done. Five of six reviewers with their commands reproduce, and a3df69c's "only status and diff" reproduces.
- 5: done. Check 5 reproduced above. The report's stated result covers semicolons only (Standards 1).
- 6: partial, Spec 1. The departure is stated and the question is put to the user, but the report adds a sentence about ADR 0010 that the ADR does not support.
- 7: done, with one wrong detail, Proof 1.
- 8: done. Finding 6 is stated as a departure; the quote of "Reports" and the five landing reports reproduce.
- 9: done. Finding 8 reproduces (the quoted bullet exists, `report.md` has neither a NOT DONE line nor a ledger).
- Spec 1 of the first refuter report (the cases' first run): closed with no change, and the report keeps it as NOT DONE on its first lines. A reading made before the run cannot be supplied now. I judge this a true closure, not a removal.

Brief's "What to build", whole step, conditions 1 to 11:

- 1: holds. First `/spec` is `spec 5 1` at 20:55:10; plan 3 opened first at 41b86f4 (20:54:40).
- 2: holds. Launch commits c540ae3 (20:57:29) and 150e6e8 (20:58:41) come before the first landing 37845b0 (21:00:51).
- 3: holds. Run notes line 7 judges the pair at the pick; `spec 3 1` at 21:03:20 comes after 37845b0.
- 4: holds. The `preparing` entry of plan 5 step 2 is written at 21:01:28 (notes line 23) while plan 3 step 2 stands until c59dbea at 21:03:11.
- 5: violated, in its record part only. The limit was never exceeded (every count in the commit table and the pick table is 0, 1 or 2). The notes hold no pick line after 8439f8f and after 6379a69, so "one line per pick" is not met. The report now says so (first refuter report, Proof 1; this round's report, first lines and row 5). The notes cannot be rewritten.
- 6: holds. Between each `/land` call (21:00:08, 21:02:28, 21:08:02, 21:19:06, 21:27:31) and its landing commit there is no Skill call and no other commit on main. The five landings come in the order of their last review's end.
- 7: holds. Notes line 44 holds the pair; `spec 3 3` at 21:21:57 follows 8439f8f; brief 3 line 15 names the rewrite; `plan.md.txt.md` line 89 quotes `PASS: docs/guide.md`.
- 8: holds. `report.md` lines 3 and 7 are in the closing form of "Reports", each followed by its open item.
- 9: holds. No AskUserQuestion; no `choices.md` in the scratch `.scratch`; both plans opened under the quoted rulings (notes lines 2 and 3).
- 10: holds. 21 Skill calls cover every `/plan`, `/plan-orchestration`, `/spec`, `/refute`, `/land` and `/roadmap` of the run; the pin reads 61d3eab before (notes line 1) and now.
- 11: holds. The first refuter ran with the scratch repository in place, and so does this review.

Cases of the brief's "Cases":

- First `/spec` is plan 5's step 1: met, transcript line 30822.
- Plan 3's step 1 waits and is prepared after plan 5's step 1 lands: met, notes line 7, `spec 3 1` 21:03:20 after 37845b0.
- Plan 3's step 2 beside plan 5's step 1, two in flight: met, 150e6e8 holds one entry in each plan.
- Plan 5's step 2 takes the freed slot, `preparing` while plan 3's step 2 is unlanded: met, notes line 23 against c59dbea.
- Verify list rewritten, PASS line booked, plan 3's step 3 not specced before 8439f8f: met, brief 3 line 15, `plan.md.txt.md` line 89, `spec 3 3` 21:21:57.
- Every landing in verification order, none held back: met. The 72 s between the end of plan 3 step 1's review and `/land 3 1` is the finishing of `/spec 5 2`.
- Both plans at their closings with the position lines and open items: met.
- No open item outside the six kinds, no question: met.
- The cases' first run before the run: not done, as the report says on its first lines; the record meets every case.

### Findings

Spec

1. 4-report.md, "Findings of the run" 1, bullets 6 and 7: "The question it raises is the user's: under ADR 0010 a step's landing does not run the check that step adds." and "That fix would need ADR 0010 superseded." What is wrong: the round brief asked to name the question for the user "without a recommendation that overrides ADR 0010". ADR 0010 does not say that a landing does not run the added check, and its Decision reads "`/land` before it runs the verify list, compare the plan's verify list with the verification page's commands". That wording allows the compare after the cherry-pick, which is the order the run took. Only `land` Steps 2, which places the compare before the cherry-pick of Steps 4, produces the missing check. Whether 2.K's fix needs the ADR superseded or only a change to `land` Steps 2 is not settled by the texts, and the report states it as settled. (The report also says `land` "What it reads" 8 reads the page "on main"; item 8 names the page without saying whose copy, and "on main" is an inference from Steps 2 coming before Steps 4.) Failure scenario: the user reads that entry 2.K's fix needs an ADR supersession and either opens a supersession that the ADR text does not require or drops the fix. Verdict: round item 6 partial; no condition changes.

Proof

1. 4-report.md line 270: "Builders afc9aa3f92bc74bf1, aa0e9d44326c1ae87, a115b0da88ae3351b and a7ac8220a5207dd70 ran `git status` and `git diff`." What is wrong: aa0e9d44326c1ae87 ran `git status --short` three times (20:58:39, 20:58:46, 20:59:05) and no `git diff`; the other three did run both. The round brief's item 7 carries the same sentence, which came from the first refuter report; the report repeated it without the rerun. The decision resting on it is the scope of the text change for the builder's git rule. Failure scenario: the later entry counts four builders reading diffs where three did, a small error in the evidence for a text conflict that is real. Verdict: round item 7 holds apart from this detail.
2. 4-report.md line 60: "The reviewer's own count, by another rule, is 11 of 92." What is wrong: 92 reproduces (any cd into the scratch repository, 20:53:00 to 21:30:00), but 8 of those carry the check, not 11. The 11 comes from counting every `show-toplevel` call since 20:40, two of which (20:52:43, 20:52:53) are before the run. The report's own 84 and 8 reproduce. No decision rests on the 11. Failure scenario: a reader sees two different figures for one fact and takes the larger as the measure. Verdict: none; round item 1 holds.
3. 4-report.md, DONE / NOT DONE rows 1, 3, 4 and 9, rewritten for sentence length: the evidence dropped the preparation commits (4bfa048, b7d8bd2, 52682d0), the statement that the `preparing` entry of plan 5 step 2 "stood on disk" until its preparation commit, and, for row 9, the two opening commits 41b86f4 and fce74d0 ("both plans opened under the quoted rulings without the stop"). Condition 9 includes that opening. What is wrong: each row still supports its condition (the commit table and notes lines 2 and 3 hold the dropped facts), but the row for condition 9 no longer cites the opening, which the brief's condition names. Failure scenario: a reader checking condition 9 from the table alone finds no evidence for the plans' opening under the rulings. Verdict: none; condition 9 holds by notes lines 2 and 3 and the commits.

Standards

1. 4-report.md line 70 and line 297: "Check 5, read after the round: the running prose outside tables, code blocks and the file list holds no semicolon outside quoted text." What is wrong: the claim reproduces (3 semicolons, all in a code span or a quotation, against 14 before). The round brief asked for the result of reading against sections B and E as found; the report states only the semicolon result. Section E's sentence length is not stated: 17 sentences run 21 to 27 words, none over 30, no table-cell sentence over 20 (16 and 11 before). Section D's paragraph length is outside check 5 but shows in the same file: line 22 has six sentences and line 265 five, against "roughly four". The list items each hold one rule. Failure scenario: a reader of the landing booking takes check 5 as covering sentence length when the report says nothing about it. Verdict: none on the numbered conditions; round item 5 done in substance, its stated result incomplete.

Behaviour

- none. "User-visible changes" still reads "None in Ordo outside the ledger", which the diff since f118104 (one file, the report) and the worktree's empty diff confirm.

No finding closes by removal except Proof 3, which is evidence trimmed while the condition still holds.

### Declined to judge

- Whether `/land` should compare against the page on main before the cherry-pick or against the page as the cherry-pick brings it, and whether entry 2.K's fix needs ADR 0010 superseded: the user's call (Spec 1).
- Whether a closing step marked "orchestrator, no agent" goes through `/spec` and takes a slot (finding 5): the texts are silent and the choice is the user's.
- Whether one rulings bullet ending "(the user)." may carry `(approved)` step lines whose check wording is the orchestrator's: the user's call, raised in the brief check.
- Section E's rule on five or more consecutive sentences of the same length, and the passive-voice rule: not checked.
- The run notes' own UTC stamps were checked against the transcript for the landings, the picks and the preflights (the `/land` call times 21:00:08, 21:02:28, 21:08:02, 21:19:06, 21:27:31 and the 12 agents' first and last timestamps), not for the other lines.
- The cherry-pick times of the landings table (from the notes and `land.sh` output) were not re-derived beyond the first refuter's check.

Usage: a6ca10935d8f1088b, claude-sonnet-5-5, 186254 tokens, 54 tool uses, 6 min 43 s

## Closed

- First run, Spec 1 (the cases' first run): closed with no change. The report keeps it NOT DONE on its first lines, and a reading made before the run cannot be supplied after it.
- First run, Spec 2, Proof 1 to 3, Standards 1 and Behaviour 1 to 4: fixed in repair round 1, as the run over round 1 reproduces.
- Run over round 1, Spec 1, Proof 1 to 3 and Standards 1: each small and inside the brief, fixed at landing in `4-report.md`: finding 1 no longer says ADR 0010 settles the question, and quotes its Decision; finding 7 names three builders for `git diff` and aa0e9d44326c1ae87 for `git status` alone; the reviewers' 11 of 92 is restated as 8 of 92 by the wider rule; rows 1, 3, 4 and 9 carry the preparation commits, the on-disk `preparing` entry and the two opening commits again; check 5 states the sentence-length result.

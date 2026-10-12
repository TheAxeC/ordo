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

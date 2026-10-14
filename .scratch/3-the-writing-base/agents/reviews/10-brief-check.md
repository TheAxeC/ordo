# Brief check of step 10 of plan 3 (on main at c01c025)

Files read in full: `.scratch/3-the-writing-base/agents/briefs/10.md`, `plan.md` (Goal, Gate, step 10's line, Rulings, the Step 0 sections of steps 6, 8 and 10, the bookings of steps 8 and 9), `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, `skills/repo-setup/templates/docs/dev/prose-standard.md`, `docs/glossary.md`, every `docs/adr/NNNN-*.md`, step 8's brief (through `diff 8.md 10.md`), and `8-report.md` lines 1 to 216. `skills/writing/SKILL.md` was read for "What it reads", Steps and step 9's diff. I changed no file.

## Names

The names the step writes are `10-run/` and its files, `10-marks.md`, `10-report.md` and the role names "... run of step 10". Command: `grep -rn --exclude-dir=.git -e '10-run' -e '10-marks' -e '10-report' -e 'run of step 10' . | grep -v '^./.scratch/3-the-writing-base/agents/briefs/10.md:'`. Hits outside the brief's paths:

1. `.scratch/3-the-writing-base/plan.md:30`, step 10's line, names `agents/reviews/10-marks.md`. The step writes that file, so the line stays true.
2. Five hits in the archived ledgers: `.scratch/archive/2-e-grill/agents/briefs/10.md:91` and `:135`, `.../2-e-grill/agents/briefs/10-round-1.md:13`, `.../2-e-grill/agents/reviews/10-report.md:191` and `:367`, `.scratch/archive/1-one-layout-for-every-skill/agents/briefs/10.md:27` and `.../reviews/10-refuter.md:120`. Each names another plan's `10-report.md` in that plan's own folder. The step makes none of them false.
3. `ls .scratch/3-the-writing-base/agents/reviews/ | grep '^10'` printed nothing (exit 1). No step 10 record exists yet.
4. A term, not a path. The glossary's only "mark" entry is "**mark, of a figure**" (`docs/glossary.md`, Ordo's own terms), the label on a box in the README's figures. The brief uses "mark" for a marker's right or wrong verdict. The glossary entry is limited by "of a figure", and skill-layout's term rule binds skill text, not a ledger file. The step makes nothing false. I note it only because the same word has a second meaning.

## The step line

Step 10's line, part by part, with the brief's requirement for each:

1. "step 8's runs ... repeated": "The runs" 1 and 2 (brief lines 51 to 54), and the session's conduct (lines 56 to 66).
2. "the two fresh markers' marks": "The marks" (lines 70 to 86).
3. "on the same copies": line 49, with `diff -r` and `cmp` before the runs and after the marks.
4. "`/writing` invoked as pinned at `v7.1.0-rc.5`": line 65, the `describe` and the `Skill` result's base directory.
5. "check: every finding of the repeated real runs marked right by both": line 103 and C9.
6. "each condition of the gate on the repeated runs read from their reports and transcripts": lines 93 to 102, conditions 1 to 9.
7. "each finding's two marks recorded in `agents/reviews/10-marks.md`": line 92.
8. "orchestrator, no agent": "How the rules file applies to this step" (lines 40 to 43).
9. "(ruling J)": line 36 and line 103.
10. "1 commit": no requirement. The brief does not say what the step's one commit holds or who makes it, and step 8's brief did not either. The record is written in the main checkout, so `/land` will find nothing to copy, as at step 8 ("nothing to copy"). The commit is presumably the landing's, but the brief does not say so.

## Premises

Each command of "What is on the tree" was rerun. Outputs:

1. Line 11. Commands: `git rev-parse --short HEAD`, `git -C ~/.local/share/ordo-stable describe --tags`, `git -C ~/.local/share/ordo-stable rev-parse --short HEAD`, `readlink ~/.claude-backup/skills/writing`, `diff -r ~/.local/share/ordo-stable/skills/writing skills/writing; echo "diff exit $?"`, `git log --oneline 509e516..HEAD`, `git tag --points-at 509e516`. They printed `c01c025`, `v7.1.0-rc.5`, `509e516`, `/Users/axelfaes/.local/share/ordo-stable/skills/writing`, `diff exit 0`, then c01c025, 88eb552, fe6f4fc and c385042, then `v7.1.0-rc.5`. Holds. The "14 skills linked" output of `pin.sh` was not rerun, since rerunning it would change the installation.
2. Line 12, the five SKILL.md bullets. `git diff 1077fe4 509e516 -- skills/writing/SKILL.md` shows each fix. `grep -c '^    [0-9]*\. ' skills/writing/SKILL.md` printed `16`, the 16 operations. The SKILL.md version line reads `version: "1.0.0"`. One wording differs. The brief says "the text it writes breaks no rule of the four pages". `grep -n` of SKILL.md shows line 134: "The text it writes breaks no rule of the prose standard, the rules page or the registers page." That is three pages. The brief elsewhere (line 73) defines "the four pages" as including SKILL.md. Small premise inaccuracy.
3. Line 18, `rules.md`. `git diff 1077fe4 509e516 -- skills/writing/references/rules.md` shows the first-use lines, the "many studies" / "some researchers" rows, "robust" in statistics, and "A section is read whole". Holds.
4. Line 19. `grep -n 'reviewer\|standards' .agents/plan.yaml` printed lines 1, 10, 11 and 13: `reviewer: claude:opus` at line 10, the prose standard in `standards` at line 13. `grep -n '^ *reviewer_effort' .agents/plan.yaml` printed nothing (`key exit 1`). SKILL.md line 29 says "`reviewer_effort` (`high` when the key is absent)". `diff ~/.local/share/ordo-stable/skills/repo-setup/templates/docs/dev/prose-standard.md skills/repo-setup/templates/docs/dev/prose-standard.md` printed nothing (`prose diff exit 0`). Holds.
5. Line 20. `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "printenv exit $?"` printed `printenv exit 1`. My own agent-type list shows ordo-low, ordo-medium, ordo-high, ordo-xhigh and ordo-max, and `ls -la ~/.claude-backup/agents` shows the five as links into `~/.local/share/ordo-stable/agents/`. Holds.
6. Line 21, run with S set to the scratchpad. `diff -r $S/3-2-run/manuscript /Users/axelfaes/workspace/research-hub/projects/manuscripts/hccnet-revision/manuscript; echo "diff exit $?"` printed `diff exit 0`. The `cmp` of the grant copy printed `cmp exit 0`. `git -C /Users/axelfaes/workspace/research-hub status --short -- projects/manuscripts/hccnet-revision funding/2026-nwo-enw-xs; echo "rh exit $?"` printed only `rh exit 0`. Holds. Nothing was written in research-hub.
7. Line 22, in the manuscript copy. `grep -n -e '\\input{' -e '\\include{' main.tex | wc -l` printed `21`. `find . -name '*.tex' | wc -l` printed `49`. `find . -name '*.tex' -exec awk 'length($0)>2000' {} \; | wc -l` printed `0`. A `python3 -I` walk of the `\input` and `\include` commands from `main.tex`, skipping comments, printed `33 33` (33 files, 33 distinct). Holds.
8. Line 23. `python3 -I skills/writing/templates/docx_paragraphs.py <copy> | wc -lw` printed `73 2751`. `grep -c '^[0-9]*: '` on the pinned script's output printed `59`. The other lines are 10 empty numbered paragraphs (such as `4:`) and 4 part lines (`[word/footnotes.xml]`, `[word/endnotes.xml]`, `[word/header1.xml]`, `[word/footer1.xml]`). 59 + 10 = 69 numbered paragraphs plus 4 part lines. Holds.
9. Line 25. `ls 8-run` printed the two reports, the four marks files and three `-resume` files. `8-report.md` has `## Place checks` at line 217. Holds.
10. Line 26. `8-report.md` lines 22, 25, 118 and 129 state the three condition 6 points ("12 draft lines", the two `grep` runs on the saved report, the grant prompts lacking the rule, "17 marks"). Holds.
11. Line 29. `ls -la` of the session transcript shows it exists (162356129 bytes). `cat .../subagents/agent-ab89cdca00b160e9a.meta.json` printed `"agentType":"ordo-high"`. `grep -o '"model":"[^"]*"' ... | sort | uniq -c` printed `8 "model":"claude-opus-5-5"`. Holds.
12. Line 30, the ADR quotes. Each quoted sentence matches its record's Decision, read with `cat docs/adr/[0-9]*.md`. Holds.
13. Line 35. `git diff --quiet 1077fe4 HEAD -- docs/dev/building.md; echo "building diff exit $?"` printed `building diff exit 0`. The state file's `verify:` list has the six commands of `docs/dev/building.md` lines 6 to 11, each with its filter from the change standard. Holds.
14. Line 68, the helpers. `cat -n extract_handback.py` shows `assert len(msgs) == 1` (line 13), each character outside ASCII written as its lower-case Unicode name (tab as `<tab>`), a final newline added (line 20), and a print of `dst, len(msgs[0]), 'chars'`. `diff extract_handback.py extract_last_handback.py` printed only `13c13 ... > msgs = msgs[-1:]`. Holds. One small mismatch: the helper writes a name for every character outside printable ASCII, the check mark the rules file allows in `.md` included, while the brief says "outside the rules file's set". This does not matter for a report.
15. Line 21, "copies of steps 4, 6 and 8": `ls $S/3-2-run` printed `grant` and `manuscript`. Holds.

## Cases and checks

1. C11 contradicts the dictated rule on `grep` (line 74). C11 asks "every `grep` run with `-n -o`", and its exception clause ("apart from a grant marker's script command on the copy and a `grep` on its output through a pipe") is attached to "no command that prints a draft file". Line 74 allows a grant marker to pipe the output "to `grep -E '^<n>: '` to find a paragraph", which has no `-n -o`. Read as written, C11 marks as unmet a command the prompt allowed. Fix: C11 says "every `grep` on a draft file run with `-n -o`", and puts the grant pipe exception (`grep -n -o` or `grep -E '^<n>: '`) on both clauses.
2. The rules file's "Where the work happens" says "No sub-agents" and "In the git worktree the brief names, never in the main checkout". Its opening says "nothing in a brief overrides anything here". The step starts six agents and writes in the main checkout. The brief grounds both in rulings and in the glossary: D6 and ADR 0003 for the review agent, Open item V for the two markers per run, and the glossary's **ledger** ("It is written on main") with executor `inline` for the main checkout. Steps 2, 4, 6 and 8 ran the same way. I read it as consistent under those rulings, not as a clash still open.
3. No case asks for a check, quote or explanation of a place the step does not change. C5 to C7 read the transcripts the step's own runs produce. C1 to C4 and C12 read the reports those runs produce.
4. The "builder's first task" paragraph (lines 123 to 128) is template text ("before changing any code"). In an inline run step the session is the builder and no code changes, but nothing in it is wrong.

## The question

Asked of each case, of the check on the step line and of each item of "What to build". The goal is the gate holding on a run of the pinned skill at v7.1.0-rc.5.

Cases:

- C1: Yes, in part. A place check passes on any part of the quoted passage. A short or common part (a word such as "the model") prints `1` at a wrong line. The markers' condition 1, required right on every row, closes this for the step's check. Requiring "the longest run of the passage on that line holding no `'` and no character outside ASCII" would make condition 1's evidence stand on its own.
- C2: Yes, in part, for the same reason as C1, closed the same way.
- C3: No for the group lines: they are read by the session and by both markers (line 85). Yes, in part, for the order "most consequential first": only the session reads it (condition 2), and no marker is asked to check it. The refuter is the only independent reader.
- C4: No. Both markers name such findings (line 85), and condition 5 lists them.
- C5: No. These are transcript facts.
- C6: No. These are transcript facts.
- C7: No. These are transcript facts.
- C8: Yes, in part. Whether a reason is "of its own" is judged by the session. In step 8 the builder's first reading let 17 such marks through, and the refuter caught them. Line 84 now defines the case, which narrows the judgment.
- C9: No.
- C10: No.
- C11: Yes, in part. `grep -n -o` with a wide pattern prints draft text. `grep -n -o '.\{0,40\}HCCNet' main.tex` printed `45:\title{HCCNet` (cut to 20 characters here). Such a command follows the letter of the dictated rule. See also Cases 1.
- C12: No. This is read through the markers' condition 4 on every row.

The check on step 10's line: Yes, in part. The step's check is "every row ... marked right by both markers and conditions 1 to 7 hold" (line 103). Condition 6 (line 99) is word for word step 8's. It does not name three things: that each prompt carries the rule on `grep` whole, that every `grep` on a draft file runs with `-n -o`, and that each prompt carries the reasons rule of line 84. Only C11 checks the first two, and no case or condition checks the third. Line 103 does not count C11. So a grant prompt could again lack the rule, which was step 8's failure, and the step's check could still hold, provided no marker broke the missing rule. In step 8, the missing rule was counted under condition 6 only by a refuter ruling (`8-report.md`, "Repair round 1", ruling 1), not by the brief's text.

Items of "What to build":

1. The copies equal their sources (line 49): No.
2. The two runs through the Skill tool (lines 51 to 54): No.
3. The session's conduct during the runs (lines 56 to 66): No. Conditions 3 and 4 read it from the transcript. Line 61 sets a turn shape, but in step 8 the user's "Please pause once the agent is done." changed that shape and the brief could not be met (`8-report.md`, "Wrong or impossible in the brief"). This brief does not say how condition 4 reads a turn shape the user changes. That does not let the check pass wrongly, but the same impossibility can recur.
4. The record of the reports (line 68): No for faithfulness: the helper's code reproduces the hand-back's `message` input, and condition 4 compares the turn text with that message. The `cmp` of a second helper run proves only that the saved file was not edited after saving. It does not prove the file equals the message. That is acceptable, since the helper's code was read.
5. Markers on `ordo-high` / `claude:opus`, independent of each other (line 70): No. Condition 6 checks the record.
6. The prompt names the report by path and holds no part of it (line 72): No. Condition 6 checks it.
7. The full reads (line 73): No. Condition 6 checks it.
8. The rule on `grep` (line 74): Yes, in part, as C11 says, and condition 6 does not check that the prompts carry it (see "The check on step 10's line").
9. The markers write nothing (line 75): No.
10. The served-model read (line 76): No.
11. The resume (line 77): it cannot make the check pass wrongly, but it can let step 8's failure recur in the same form. In step 8, rows without a reason of their own stayed because the resume left them out: manuscript marker 1's group 12 rows were not in its resume, and grant marker 1's 16s was not in its resume (`8-report.md`, C8). Line 77 says only "with the rows it left out named by number". It does not require the session to read every row against line 84 and name every row that fails it in the one resume.
12. The marks and the four conditions (lines 78 to 83): No beyond what the gate itself allows: two markers who both judge a finding wrongly is the gate's own limit.
13. The reasons (line 84): Yes, in part, as C8 says.
14. Naming group lines and malformed findings (line 85): No.
15. The final message is the marks (line 86): No.
16. The record files (lines 90 to 92): No.
17. `10-report.md` with conditions 1 to 9 (lines 93 to 102): Yes, in part, as C1 and C3 say, and condition 6 is incomplete as stated above.
18. The rule for when the check holds (line 103): Yes, in part, because condition 6 is incomplete.
19. The booking of agents (line 104): No.

## Implied inputs

This is not a code step. The step runs `/writing` and writes a record, so there are no implied inputs of code.

## ADRs

All twelve records are `Status: proposed`, and none supersedes another (read with `cat docs/adr/[0-9]*.md`).

1. 0001 touches the step under "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, ...". The brief names it, and line 73 has the markers read the same page. No contradiction.
2. 0002 touches the step under "The prose standard holds for every text the writing skills write or review." The brief names it, and condition 2 of a right mark (line 80) follows it. No contradiction.
3. 0003 touches the step under "`/writing` starts one fresh agent that changes nothing, on the model the configuration's `reviewer` names at `reviewer_effort` ..." and "The session shows its report to the user and changes nothing." The brief names it. Lines 59 and 60 and Decision 5 (saving after both runs) follow it. No contradiction.
4. 0006 touches the step under "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model". The brief names it. Line 104 books the six agents (more if a marker is restarted) in the glossary's numbered form. No contradiction.
5. Not named, touched only if a choice arises: 0004 ("A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)"") and 0005 ("Every choice taken under self-rule ... is written to `<ledger_root>/choices.md`"). In step 4 the session took such a choice mid-run (Open item G, C70 in `.scratch/choices.md`). The plan runs with `self_rule: on`. "Paths this step writes" leaves out `.scratch/choices.md`, and the brief does not say where such a choice goes. The brief contradicts neither record.
6. Not named, touched by `/spec` and `/land` rather than by the step's text: 0010 ("compare the plan's verify list with the verification page's commands") and 0012 ("Every commit a skill makes on main names its paths in the commit command"). Brief line 35 does the compare that 0010 requires. 0012 governs the step's one commit, which the brief does not describe (The step line, part 10). The brief contradicts neither.

## Dictated text

1. The rule on `grep`. `grep -n "runs as \`grep -n -o\`" 10.md` printed `74:`. It does not hold:
   - Its claim is false. "runs as `grep -n -o`, so it prints the file, the line number and the matched term and no other part of a line" is wrong when one file is named: `grep -n -o 'HCCNet' main.tex | head -2` printed `45:HCCNet` and `47:HCCNet`, with no file name. The file name is printed only with two or more files: `grep -n -o 'HCCNet' main.tex main.tex | head -2` printed `main.tex:45:HCCNet`. "No other part of a line" holds only when the pattern matches the term alone. `grep -n -o '.\{0,40\}HCCNet' main.tex` printed `45:\title{HCCNet`. Rules file rule 4 makes the brief's text the specification, so a false statement in it is a defect of the brief. The fix: the term is given as a fixed string, `grep -n -o -F -- '<term>' <file> ...`, and the sentence says what it prints with one file and with several.
   - Prose standard, section E, sentence length: sentences of about 43 words ("`grep` serves only to find a line number ... no other part of a line."), 37 and 38 words (counted with a `python3 -I` sentence split, so approximate).
   - Prose standard, section B, semicolons: two in about 170 words ("is not run; the marker finds ..." and "to find a paragraph; these are the one exception").
   - It contradicts C11 on the grant pipe (Cases and checks, finding 1).
   - "carries this rule whole" does not say where the rule ends. The bullet closes with "This plans for step 10's Step 0.", which is a note to the brief's reader and does not belong in a marker prompt. Fix: the rule's words are set off, for example as a quoted block, so "whole" is clear.
2. The rule on reasons. `grep -n "is not a reason of its own" 10.md` printed `84:`. Its content holds against the rules file, skill-layout and the glossary. It covers the three forms of step 8's 17 marks: a sentence over a list, through the new sentence; "Same ..." notes, through "each row's reason names its own passage and replacement"; and a bare "Right.", through the first sentence. It breaks prose standard section E: sentences of about 31, 23 and 36 words. Unlike line 74, it does not say that every prompt carries it whole (Step 0 carried, finding 3).
3. The four conditions of a right mark and their opening line. `grep -n -e '^  [1-4]\. ' -e 'are marked together' 10.md` printed 79, 80, 81, 82 and 83 (with 94 to 97, which are the report's conditions). The opening line is 78.
   - Line 78 breaks section E (one sentence of about 61 words) and section D, "Three or more list-shaped items in paragraph form become a list": "each numbered finding, each further place ..., each split ... and each entry of a list of places".
   - Line 79 holds (about 26 words, which "unless the mechanism needs more" can cover).
   - Line 80 holds. Its first sentence runs about 30 words. It agrees with ADR 0002.
   - Line 81 holds.
   - Line 82 breaks section E (a sentence of about 46 words) and section B (a semicolon in about 90 words). Its "a rule of the four pages" counts `SKILL.md` as a page whose rules a passage can break, while `SKILL.md`, "What you report", reports only breaks of "the prose standard, the rules page or the registers page". This does no harm, since condition 4 reads the replacement against `SKILL.md`'s finding rules anyway. Writing "the three pages" here would match the skill.
   - Line 83 holds (about 30 words).

These lines repeat step 8's wording, apart from the changes the `diff 8.md 10.md` shows in lines 74 and 84. The step 8 brief check read none of them as dictated text.

## Step 0 carried

1. Point 1, the grant prompts lacking the rule on `grep`, is carried. Line 74 says "Each of the four prompts, the grant markers' included, carries this rule whole", and C11 checks it. It is not in condition 6 (line 99), which `diff 8.md 10.md` shows unchanged from step 8, and line 103 counts only conditions 1 to 7. So step 8's failure can recur without failing the step's check. Fix: condition 6 names the comparison of each `Agent` prompt with line 74's rule, word for word.
2. Point 2, `grep` without `-o` and `grep` on the saved report, is carried in line 74 ("runs as `grep -n -o`" and "the saved report and the four pages included, is not run") and in C11. Two gaps remain. `-o` without a fixed-string pattern still prints draft text (Dictated text, finding 1). Condition 6 checks a `grep` outside the draft but not `-n -o`. Manuscript marker 1's step 8 failure (`grep -n` piped to `cut -c1-80`) is caught in that exact form. The near form, `grep -n -o '.\{0,80\}CNN'`, is allowed by the rule's letter.
3. Point 3, the 17 marks, is carried in line 84, and condition 6's "every row with a reason of its own" covers it. Two gaps remain. Line 84 does not say that each prompt carries it whole, although step 8's grant prompts shortened the reasons rule. The step 8 transcript shows this: in the Agent prompts at session transcript lines 41362 and 41363, the reasons sentence ends "names only a rule's category and the new word is not enough", without the brief's example. No case checks the prompts for it. Also, step 8's 17 marks survived because the one resume left rows out (Question, item 11). Line 77 does not ask that every row failing line 84's definition be named in the one resume.
4. Nothing is loosened against step 8's brief. The `diff 8.md 10.md` output shows only tightened text: line 74 (all four prompts, `-n -o`, the report and the pages excluded, the grant pipe limited to `grep -n -o` or `grep -E '^<n>: '` where step 8 allowed any `grep`), line 84 (the new sentence), and C11 (the prompt check and `-n -o`). The rest is a change of step number, tag, commit or row counts. Line 103 replaces "step 9 fixes each failure" with "the failure goes to the user as an open item", as ruling J says. The grant `grep -E '^<n>: '` pipe prints a whole paragraph. That is no loosening, since step 8's text allowed any `grep` on the pipe and step 8 accepted grant marker 1's `grep -E '^(35|41|42):'`.

## Declined to judge

- Whether `sh utils/pin.sh v7.1.0-rc.5` printed "14 skills linked": not rerun, since running it changes the installed links.
- Whether the twelve cases' wording is the best gate design: that is the orchestrator's and the user's call. I checked only consistency and the question.
- Whether the sentence-length overruns in the dictated lines are covered by "unless the mechanism needs more": the standard leaves this to judgment. I give the counts and the sentences, and the orchestrator decides.
- The rest of `8-report.md` (its "Place checks" section, lines 217 to 1283): not needed for any check above.
- Brief items about the session's behaviour during the runs (turn shape, the model re-read): read against `SKILL.md` and `plan-orchestration`'s "Launching a builder" only. They can be observed only once the runs happen.

Usage: a1b59c3039b987617, claude-opus-5-5, 209032 tokens, 39 tool uses, 6.6 minutes.

## Closed

- Names 1 to 3: no change; the step makes none of those hits false.
- Names 4 ("mark"): no change; the glossary's entry is limited to a figure and binds skill text, and the brief's sense stands in a ledger file.
- The step line 10 ("1 commit"): "How the rules file applies to this step" now says the step's one commit is the landing commit of `/land`, which finds nothing to copy and commits the record with the booking.
- Premises 2 ("the four pages"): the bullet now reads "breaks no rule of the prose standard, the rules page or the registers page", as `SKILL.md` line 134 does.
- Premises 14 (the helper's character set): "The record of the reports" now says each character outside printable ASCII is written by its name.
- Cases and checks 1 (C11 against the grant pipe): C11 now asks `grep -n -o -F` for every `grep` on a draft file and puts the grant marker's script command and the two pipes the rule allows as the one exception to each clause.
- Cases and checks 2 (sub-agents and the main checkout): no change; the brief grounds both in rulings, as the report reads it.
- Cases and checks 3 and 4: no change.
- The question, C1 and C2 (a short part prints 1 at a wrong line): the place check's part is now the longest run of the quoted passage on that line with no `'` and no non-ASCII character, extended to at least four words where the line holds them.
- The question, C3 (the order checked by the session alone): each marker now says whether the groups stand most consequential first, and condition 2 lists an order either marker names as a failure.
- The question, the check on step 10's line, and Step 0 carried 1 and 3 (condition 6 does not check the prompts): condition 6 now compares each `Agent` prompt with the quoted blocks of the rule on commands and the rule on reasons line by line, and C11 checks both blocks.
- The question, item 3 (a turn shape the user changes): condition 4 now quotes such an instruction with its entry and reads the condition on the rest.
- The question, item 11, and Step 0 carried 3 (the resume left rows out): the session now reads every row against the rule on reasons before any resume and names every failing row in the one resume.
- Dictated text 1 (the rule on `grep`): rewritten as a quoted block the prompts carry word for word. It now reads `grep -n -o -F -- '<term>' <file> ...` with a fixed-string term, and says what it prints with one file and with several. Run on the manuscript copy: `grep -n -o -F -- 'HCCNet' main.tex | head -2` printed `45:HCCNet` and `47:HCCNet`, and with two files `main.tex:45:HCCNet` and `main.tex:47:HCCNet`. Each sentence of the block is within section E, the longest 22 words counting the command, and the block holds no semicolon. The step-0 note stands outside the block.
- Dictated text 2 (the rule on reasons): rewritten as a quoted block the prompts carry word for word, one or two sentences per line, each within section E (the longest, with its command, 22 words).
- Dictated text 3 (line 78 and line 82): line 78's rows are now a list under the sentence, and its sentences are split. Line 82's "a rule of the four pages" now reads "a rule of the prose standard, the rules page or the registers page", and its long sentence and semicolon are split into three sentences.
- ADRs 5 (0004 and 0005): the brief names both under "What is on the tree", and "Paths this step writes" holds `.scratch/choices.md` only when a choice is taken under self-rule.
- ADRs 6 (0010 and 0012): no change; `/spec` and `/land` carry them.
- Step 0 carried 2 (`-o` with a pattern prints draft text): the rule now gives the term as a fixed string with no pattern around it.
- Step 0 carried 4: no change.

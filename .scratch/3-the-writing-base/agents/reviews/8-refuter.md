# Step 8 refuter report (on .agents/worktrees/3-the-writing-base-8, base a34bfbf)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

The step's output is ledger records in the main checkout, so the ledger files below are cited by path and line (paths relative to /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/). The session transcript is /Users/axelfaes/.claude-backup/projects/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda.jsonl; entry numbers below are 1-based line numbers of that file (8-report.md uses 0-based numbers, one lower). Every scratch file of this review is under /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/refute8/; nothing was written in the repository.

## Verification (rerun by the reviewer)

```
Verify 1: printf '%s\0' 8-marks.md 8-report.md 8-run/* | xargs -0 perl -CSD -ne '<the check>'
  printed nothing; verify1 exit 0
Verify 2: diff -r <scratchpad>/3-2-run/manuscript <source>; cmp <grant copy> <source>
  diff exit 0
  cmp exit 0
Verify 3: git -C research-hub status --short -- projects/manuscripts/hccnet-revision funding/2026-nwo-enw-xs
  printed nothing; rh status exit 0
Verify 4: git status --short   (in .agents/worktrees/3-the-writing-base-8)
  printed nothing; worktree status exit 0
  git diff a34bfbf | wc -c   (in the worktree): 0
Main checkout: git status --short
  M .scratch/3-the-writing-base/orchestrator-state.md
  ?? .scratch/3-the-writing-base/agents/reviews/8-marks.md
  ?? .scratch/3-the-writing-base/agents/reviews/8-report.md
  ?? .scratch/3-the-writing-base/agents/reviews/8-run/
git show a34bfbf:.scratch/3-the-writing-base/agents/reviews/8-marks.md
  fatal: path '...8-marks.md' exists on disk, but not in 'a34bfbf'; exit 128
git show a34bfbf:.scratch/3-the-writing-base/agents/reviews/8-run/
  fatal: path '...8-run/' exists on disk, but not in 'a34bfbf'; exit 128
git show a34bfbf:.scratch/3-the-writing-base/agents/reviews/ | grep '^8-'
  8-brief-check.md
Helper reruns into the scratchpad, compared with the saved files:
  extract_handback.py on ad512c438c546f57c: 85932; cmp with 8-run/manuscript-report.md exit 0
  extract_handback.py on ab89cdca00b160e9a: 54673; cmp with 8-run/grant-report.md exit 0
  first SubagentHandback of a8f3e0b981dc00ca4, aa83277990558acd9, a5b964c740016412e, a136ed68531e76d65,
  and extract_last_handback.py for both resumes: tail -n +3 <saved> | cmp - <rerun>: exit 0 for all six
  characters outside ASCII written by name: manuscript report 1, grant report 4 (as 8-report.md states)
Turn-ending texts (python3 -I, ==): entry 41278 text (85932) == manuscript hand-back: True;
  entry 41338 text (54673) == grant hand-back: True
Row counts (my parser over the marks files and the 8-marks.md tables):
  manuscript: marker 1 228 rows (181 right, 47 wrong), marker 2 228 (200 right, 28 wrong), table 228,
    0 row mismatches; not right by both 48; both wrong 27
  grant: marker 1 74 (42 right, 32 wrong), marker 2 74 (47 right, 27 wrong), table 74, 0 mismatches;
    not right by both 35; both wrong 24
  manuscript report: 91 numbered findings + 122 tense + 9 synonym + 6 dash entries = 228; grant `^Place:` = 74
  "Rows not marked right by both": 48 + 35 rows, 166 marker sub-bullets; keys, places and marks equal the tables
Place checks: all 351 commands of 8-report.md "Place checks" rerun (251 manuscript, 100 grant): 0 print other than 1
6-marks.md: "191 rows." and "74 rows." present (condition 8)
grep -n '^\*\*Right\.\*\*$' style check, sed -n '105,124p' 8-run/grant-marks-1.md:
  rows 16k, 16l, 16q, 16s, 16x, 16y read "**Right.**" with no reason (six rows)
python3 -I count over 8-run/manuscript-marks-1.md lines 116-241 (tense list, right rows):
  right rows 113, notes of 25 characters or fewer 93; most common: 'Result.' 21, 'Both verbs fixed.' 5,
  'Also in 13.16.' 3, 'Also in 13.18.' 3
Marker prompts (entries 41360-41363, python3 -I): ordo-high x4, 5914/5914/4477/4477 characters;
  manuscript "Commands:" line: "every `grep` names each file it searches by its absolute path, one of the
  33 files above. A `grep` on a folder, with a glob, or with `-r` is not run."
  grant "Commands:" line: "you run that command on the copy, which prints the draft, and you may pipe
  its output to `grep`; these are the one exception to the rule that no command prints the draft. No
  other command reads the draft."
grep -c <the six agent ids> plan.md: 0 (no step 8 agent booked yet; booking is landing work)
```

Transcript reads (python3 -I over the session and agent transcripts): manuscript span Skill 41169 to report 41278 holds Bash 41181 (config grep, ls of the prose standard, Steps 3 grep of main.tex), Bash 41186 (the grep over the 21 input files with a sed prefix), Bash 41189 (the 11 nested files, printenv), Agent 41193, Bash 41202 (model read), Bash 41212, Bash 41216, Bash 41233, Read 41259 and 41269 of the tool-results copy of the hand-back; no write, no sleep, no draft read. Grant span Skill 41294 to report 41338 holds Bash 41305, Agent 41309, Bash 41317, Read 41329. The user's "Please pause once the agent is done." is entry 41242; "Please continue" 41287; the state-file write 41291 lies between the spans. Both Skill results name the base directory /Users/axelfaes/.claude-backup/skills/writing. Review agents: ad512c438c546f57c Read 36, Bash 1, SubagentHandback 1, 46 lines of claude-opus-5-5 and no other model; ab89cdca00b160e9a Read 3, Bash 2, SubagentHandback 1, 8 lines of claude-opus-5-5. Markers: a8f3e0b981dc00ca4 Read 39, Bash 3 (49 model lines), aa83277990558acd9 Read 39, SubagentHandback 2 (47), a5b964c740016412e Read 7, Bash 4, SubagentHandback 2 (19), a136ed68531e76d65 Read 5, Bash 1 (9); all claude-opus-5-5 only.

Named place-check sample, each read against the draft line and the review agent's message: manuscript 3_hyperparams.tex:3, e_finetuning.tex:1, main.tex:49, a_data.tex:1, a_longitudinal_analysis.tex:7 and :5, b_implementation.tex:3, 2_reliability.tex:3, discussion.tex:12, introduction.tex:7, b_architecture.tex:5, and the splits 13.5, 13.8 (d_pretraining.tex:8), 13.9, 13.10 (d_pretraining.tex:10 and :15), 13.11; grant paragraphs at report lines 974, 998, 1007, 1037, 1112, 1118, 1139, 1151, 1154, 1184, 1211, and the splits 16k (paragraph 35), 16y and 8g (paragraph 42). All print 1 and the quoted part stands in the line.

## Verdicts

Items of the brief's "What to build", in its order:

- The runs: holds. Both invoked through the Skill tool (entries 41169, 41294), one Agent call each (41193, 41309), ordo-high, served claude-opus-5-5 only, the session's spans hold no write, no sleep and no draft read beyond the Steps 3 grep, and each report is the whole turn-ending text (== True). The brief's turn shape for the grant run did not hold, because the user asked the session at entry 41242 to pause once the agent was done; 8-report.md discloses it in its first line, condition 4 and "Wrong or impossible in the brief".
- The record of the reports: holds. Helper reruns cmp exit 0 for both; the one and four named characters match.
- The marks: violated in part. Four fresh distinct ordo-high agents, served claude-opus-5-5, given the report by path, prompts holding no report line (holds). Two parts fail: the grant marker prompts do not carry the brief's grep rule (Spec 1), and the "reason of its own on every row" requirement is not met for grant row 16s and is not met by manuscript marker 1's tense-list notes (Proof 1, Proof 2).
- The record files: holds. Every listed path exists; saved texts equal the agents' messages; the 8-marks.md tables equal the marks files row by row (0 mismatches) and the "Rows not marked right by both" list carries both reasons faithfully, apart from one misfiled example in 8-report.md (Proof 5).
- Condition 1: holds; 351 place checks rerun, all 1.
- Condition 2: fails, as reported; the eight failing lines and the markers' reasons (8-marks.md "Group lines either marker names...") match the marks files. The session's reading of manuscript group 10 is under "Declined to judge".
- Condition 3: holds, as reported.
- Condition 4: holds on writes and reads; the turn-shape part is not met, at the user's instruction, and disclosed.
- Condition 5: fails, as reported; the three double places and the two instruction/reference findings check out against both manuscript marks files.
- Condition 6: fails, as reported, but the failure list is incomplete (Proof 1, Proof 3).
- Condition 7: holds (rerun).
- Condition 8: holds (191 and 74 in 6-marks.md; 228 and 74 now).
- Condition 9: holds; the sentence is in 8-report.md condition 9.
- The check: holds as a record. The first line says NOT DONE and names conditions 2, 5 and 6 and the row counts; step 9 per ruling I; no open item. The list of what fails under conditions 6 and the C8/C11 lines is short of what the files show (Proof 1 to 3).
- The booking of agents: not applicable at this review; it is landing work, and `grep -c` of the six ids in plan.md prints 0. 8-report.md's DONE/NOT DONE table carries id, type, served model and usage for all six agents, the two resumes included, so the booking has its source.

Cases of the brief's "Cases":

- C1: met; 251 manuscript place checks rerun, all 1, every place with its path from the main file's folder.
- C2: met; 100 grant place checks rerun, all 1; header place "paragraph 64 [word/header1.xml]".
- C3: unmet; eight group lines fail, recorded correctly (the run's failure, not a finding).
- C4: unmet; tense entry at b_implementation.tex:3 and finding 5.2, recorded correctly.
- C5: met; review agents' tool uses and commands as above.
- C6: met; reports saved by the helper, cmp exit 0.
- C7: partial; writes and reads met, the grant Skill call stands in the turn "Please continue" started (41287), not in the turn the manuscript notice started; caused by the user's pause and disclosed.
- C8: partial; Proof 1 (grant row 16s has no reason) and Proof 2 (manuscript marker 1's tense-list notes).
- C9: met as a record; 8-marks.md tables and list rechecked by script and by reading.
- C10: met; four starts, all used; prompts and resume messages hold no report line or quoted report words.
- C11: unmet; manuscript marker 1's third command as the report says, and also two greps on report files the report does not judge (Proof 3).
- C12: unmet; recorded correctly.

## 1. Spec

- Session transcript entries 41362 and 41363 (the two grant marker prompts), "Commands:" line: "you run that command on the copy, which prints the draft, and you may pipe its output to `grep`; these are the one exception to the rule that no command prints the draft. No other command reads the draft."; what is wrong: the brief's "What to build", the marker-prompt bullet, says "The prompt says that no `cat`, `sed`, `head`, `tail` or `grep` prints a draft file. It says that `grep` serves only to find a line number in a file the marker has already read whole, and that every `grep` names each file it searches by its path, one of the files the prompt lists. A `grep` on a folder, with a glob, or with `-r` is not run.", and plan.md's step 8 Step 0 says "Each marker's prompt of step 8 says that `grep` runs only on the draft's files, each named by its path." The manuscript prompts (41360, 41361) carry it; the grant prompts carry neither the named-file rule nor the folder, glob and `-r` ban. 8-report.md condition 6 does not mention the gap. No grant marker ran a folder grep, so no mark was affected; failure scenario: a grant marker following its prompt may run `grep -r` over `8-run/` and read the other marker's marks or the manuscript files, which is the Step 0 case the brief planned for, and the record would show no prompt rule it broke; verdict: the marks item violated in part.

## 2. Proof

- 8-run/grant-marks-1.md:117 (row 16s, paragraph 41): "- 16 / paragraph 41 / \"Within the liver outline... The number of components...\" **Right.**"; what is wrong: 8-report.md C8 says "Grant marker 1 gave five rows no reason and two a reason naming only the new word ... Each was resumed once and gave the reasons", and condition 6 says "Every row has a reason of its own after the two resumes". Grant marker 1 gave six rows a bare "Right." (16k, 16l, 16q, 16s, 16x, 16y at lines 109, 110, 115, 117, 122, 123). The resume (8-marks.md line 3 and 8-run/grant-marks-1-resume.md line 1) names 8a, 8e, 16k, 16l, 16q, 16x and 16y; 16s is not among them and the reply gives it no reason. The brief allows one resume per marker, so the row stays without a reason; failure scenario: step 9 and the user read C8 and condition 6 as met on reasons and take 16s's "right" as a reasoned mark, when marker 1 gave none for it; verdict: C8 partial, condition 6 has an unlisted failure.
- 8-run/manuscript-marks-1.md lines 116 to 241 (group 9, the tense list): for example "1. d_results.tex:5 \"shows excellent predictive capability\": right. Reported result." and "2. d_results.tex:5 \"appear to display less expressive characteristics\": right. Also in 13.18."; what is wrong: the marker prompt (entry 41360) says "A reason that names only a rule's category and the new word, such as a tense and its new verb, is not enough", and 8-report.md "Judgment calls" says "A reason that names only the new word, with a general sentence over the list, was taken as no reason of its own, and the two markers that gave such reasons were resumed once". Of marker 1's 113 right rows in the list, 93 carry a note of 25 characters or fewer: "Result." 21 times, "Both verbs fixed." 5, and cross-references such as "Also in 13.18." that give no reason at all; the general sentence over the list (line 110) carries the stand and ends claims for every row. Manuscript marker 2's comparable rows (for example 8-run/manuscript-marks-2.md:174 "\"showed\" ends the break", and its group 12 rows, which give the defining place c_variants:1) were resumed; marker 1's were not, and the report gives no reading of why marker 1's notes pass. Whether "Result." is a reason of its own is a judgment, but the session applied its own stated test to one marker and not the other; failure scenario: C8 and condition 6 are read as met on reasons, while 93 rows of one marker rest on a list-wide sentence of the kind the session counted as no reason for the other marker; verdict: C8 partial.
- 8-report.md condition 6, manuscript marker 1's first command and grant marker 1's third: "`grep -n -i -e \"still break\" -e \"still breaks\" -e \"still\" <the saved report> | cut -c1-160`, a search of the report" and "a `grep` of the saved report for \"still breaks\""; what is wrong: brief condition 6 requires "no `grep` on a folder, a glob, with `-r` or on a file outside the draft, apart from a grant marker's script command and a `grep` on its output through a pipe", and C11 says "or on a file outside the draft's 33 files". Both commands grep a report file, outside the draft, and manuscript marker 1's also breaks its prompt ("one of the 33 files above"). The report quotes both commands and judges neither: condition 6 says "Fails on manuscript marker 1's third command. The rest holds.", and C11 says "The other three markers ran no command that printed a draft line", which answers only the printing clause. The verdicts on condition 6 and C11 do not change, but grant marker 1 also fails C11 by its text; failure scenario: step 9 fixes the one command the report names and the user reads grant marker 1 as clean on C11; if the session reads a grep of the marker's own report as within the purpose of the rule, the report must say so as a judgment call, which it does not; verdict: C11 unmet for a second marker, condition 6 failure list incomplete.
- 8-report.md entry numbers throughout (for example condition 4: "At entry 41241 the user wrote \"Please pause once the agent is done.\""): what is wrong: the numbers are 0-based line indices of the transcript and the report does not say so; `sed -n '41241p'` on the transcript gives a file-history-snapshot, and the user's message is line 41242. Every entry number in conditions 3, 4 and 6 is one lower than the line a reader opens; failure scenario: the refuter of step 9 or the user checks an entry with `sed -n` or a 1-based reader and lands on the wrong entry; no verdict changes.
- 8-report.md "The rows not marked right by both", kind "A term brought in undefined": "manuscript 1.1, 5.12 and 10.4, and ConvNeXt in 6.1"; what is wrong: manuscript marker 2's 6.1 reason (8-marks.md, the 6.1 row of the list) says ConvNeXt already stands in the passage at its first use, undefined and unnamed by the finding; the replacement does not bring it in. It belongs under "a further break left unnamed"; failure scenario: step 9 looks for a defect in how the replacement adds terms in 6.1 and misses that the finding should have named the existing undefined term; no verdict changes.

## 3. Standards

- none

## 4. Behaviour

- none. The step changes no file outside the ledger; Verify 4 and `git diff a34bfbf | wc -c` (0) in the worktree confirm it.

## Declined to judge

- Manuscript group 10's line ("They cost the reader sentences that announce or flag content instead of stating it"), which 8-report.md condition 2 reads as naming a cost while reading grant 9 as naming none: neither marker named group 10, and whether the line names the reader's loss is a reading the user may dispute; it does not change condition 2's verdict.
- Whether the user's "Please pause once the agent is done." excuses the brief's turn shape for condition 4 and C7: it is the user's call; the deviation itself is verified and disclosed.
- The cases' first run: the brief's `ls` before the runs was not run, as 8-report.md discloses. I could not rerun the `git ls-tree` the report uses (outside my allowed commands); `git show a34bfbf:<path>` for 8-marks.md and 8-run/ exits 128 and the base reviews folder holds only 8-brief-check.md under `8-`, and the transcript's `mkdir -p` of 8-run at entry 41350 follows both runs, so the record did not exist before the step. Whether the substitute satisfies the brief's first-run rule is the orchestrator's ruling.
- Whether each individual mark of the four markers is right: the step records the markers' marks, and judging each of the 302 rows again is the markers' work, not this review's.

Reviewer usage: aa417a503739647c4, claude-opus-5-5, 94498 tokens, 87 tool uses, 11.3 minutes.

## Repair round 1, refuted

Step 8 of plan 3, over repair round 1 (rulings in `.scratch/3-the-writing-base/agents/briefs/8-round-1.md`). Step 8 is an inline step with no worktree change, so its output is the ledger files on main, and the round's delta is the change since commit 3328be4.

### Verification

```
Verify 1: printf '%s\0' 8-marks.md 8-report.md 8-run/* | xargs -0 perl -CSD -ne '<the check>'; echo "v1 exit $?"
  v1 exit 0   (nothing printed; 8-run/* includes the new manuscript-marks-1-resume.md)
Verify 2: diff -r <scratchpad>/3-2-run/manuscript <research-hub manuscript>   -> diff exit 0
          cmp <grant copy> <research-hub docx>                                 -> cmp exit 0
Verify 3: git -C research-hub status --short -- projects/manuscripts/hccnet-revision funding/2026-nwo-enw-xs
  rh exit 0   (nothing printed)
Verify 4: git status --short in .agents/worktrees/3-the-writing-base-8 -> wt exit 0 (nothing printed); git diff a34bfbf | wc -c -> 0
Main checkout: git status --short
   M .scratch/3-the-writing-base/agents/reviews/8-marks.md
   M .scratch/3-the-writing-base/agents/reviews/8-report.md
   M .scratch/3-the-writing-base/orchestrator-state.md
  ?? .scratch/3-the-writing-base/agents/reviews/8-run/manuscript-marks-1-resume.md
Delta basis: git show 3328be4:<path> | cmp - <sent copy> prints "8-report.md sent copy equals 3328be4" and "8-marks.md sent copy equals 3328be4".
Delta: diff -u of the sent 8-marks.md shows one changed paragraph (the header, 2 lines); diff -u of 8-report.md shows the changes read below; orchestrator-state.md gains one position line.
Place checks: all 351 commands under "Place checks" of 8-report.md rerun in python3 -I (251 from <scratchpad>/3-2-run/manuscript, 100 from the repository root): (251, 0) and (100, 0), 0 print other than 1.
Resume file: python3 -I rebuild of the last SubagentHandback of agent-a8f3e0b981dc00ca4.jsonl with characters outside ASCII written by name, compared with manuscript-marks-1-resume.md after its two header lines: True (32476 characters, 0 characters outside ASCII in the message); the first hand-back compared with manuscript-marks-1.md: True.
Resume content: 113 entries (Methodology 83, Results 30); the set of (list, number) equals the set of manuscript marker 1's right rows in manuscript-marks-1.md lines 116-241 (True); the wrong rows left out are Methodology 56, 57, 67 and Results 5, 10, 16, 24, 26, 29; the place of every entry equals the place in the original marks (0 mismatches). The reply says "All marks stay as they were."
Resume run: session entry 41998 (SendMessage to a8f3e0b981dc00ca4), completion notice entry 42030: <usage><subagent_tokens>333087</subagent_tokens><tool_uses>18</tool_uses><duration_ms>155910</duration_ms> (2.6 min). agent-a8f3e0b981dc00ca4.jsonl: 71 lines of "model":"claude-opus-5-5" and no other model; meta.json agentType ordo-high; after its first hand-back: Read 17, SubagentHandback 1, no Bash (the 17 Reads are 13 draft files, report lines 300-426 and three table files).
Entry numbers (1-based line numbers of the session transcript, python3 -I): 41169 Skill writing (manuscript); 41193 Agent; 41205, 41225, 41238, 41250 assistant text ending turns; 41242 user "Please pause once the agent is done."; 41256 the agent's hand-back message; 41278 text of 85932 characters; 41287 user "Please continue"; 41291 Bash writing the state file; 41294 Skill (grant); 41309 Agent; 41338 text of 54673; 41350 Bash with mkdir -p 8-run; 41360-41363 the four marker Agent calls (ordo-high; 5914, 5914, 4477, 4477 characters); 41608 and 41609 the two earlier SendMessage resumes; 41998 the round-1 resume. All 22 numbers in 8-report.md are one above the 0-based index and match their entries.
Marker prompts 41362 and 41363, "Commands:" line: "you run that command on the copy, which prints the draft, and you may pipe its output to `grep`; these are the one exception to the rule that no command prints the draft. No other command reads the draft." (no named-file rule, no folder/glob/-r ban); 41360 and 41361 carry both.
Marker commands (python3 -I over the four agent transcripts): manuscript marker 1 Bash 3 (grep -n -i ... on manuscript-report.md; grep -n -o ... on 13 named draft files; grep ... on main.tex and four named draft files, with cut -c1-80 and -c1-200 and no -o); manuscript marker 2 none; grant marker 1 Bash 4 (script command; script piped to grep three times; grep -n -i -E 'still breaks|still break' on grant-report.md; script piped to grep -E '^(35|41|42):'); grant marker 2 Bash 1 (script command).
Grant row 16s: grant-marks-1.md lines 109, 110, 115, 117, 122, 123 read "**Right.**" with no reason (16k, 16l, 16q, 16s, 16x, 16y); grant-marks-1-resume.md names 8a, 8e, 16k, 16l, 16q, 16x, 16y and not 16s.
Files: wc -l gives 583 (8-marks.md), 130 (8-refuter.md), 1283 (8-report.md), 89, 150, 193, 595, 471, 344, 647, 300, 632 (the 8-run files) and 14 (8-round-1.md): every number in the report's "Files" block equals it.
```

### Verdicts

The step's check fails by design of ruling I (step 9 follows). The verdicts below judge whether the record states its results truly.

Items of the brief's "What to build", in its order:

- The runs: holds. Skill calls 41169 and 41294, one Agent call each (41193, 41309), ordo-high, served claude-opus-5-5 only, the spans hold no write, no sleep and no draft read beyond the Steps 3 grep, and the turn-ending texts equal the hand-backs (the report quotes `True` twice and the numbers now match the 1-based entries). The turn shape of the grant run differs at the user's instruction (entry 41242), disclosed in the first lines, condition 4 and "Wrong or impossible in the brief".
- The record of the reports: holds. The saved resume file also equals the agent's last hand-back (True above).
- The marks: violated in part, Spec 1 of the first review (the grant marker prompts lack the grep rule), which the report now states in condition 6 and C11; the missing reasons are Proof 1 below.
- The record files: holds. `8-marks.md` differs from the sent copy only in its header, which now records the round-1 resume and grant row 16s truthfully; the 48 and 35 rows not marked right by both are unchanged because no mark changed.
- Condition 1: holds (351 of 351 place checks print 1).
- Condition 2: fails, as the report says (unchanged by the round).
- Condition 3: holds.
- Condition 4: holds on writes and reads; the turn shape differs at the user's instruction.
- Condition 5: fails, as the report says.
- Condition 6: fails, as the report says, now with the five points the first review found (M1's third command, M1's first command, G1's third command, the grant prompts, row 16s); the list of reasons is still short of what the files show (Proof 1).
- Condition 7: holds (diff exit 0, cmp exit 0).
- Condition 8: holds (228 against 191, 74 against 74).
- Condition 9: holds.
- The check and the first line: holds as a record; the first line names conditions 2, 5 and 6 and the row counts.
- The booking of agents: not applicable at this review (landing work).

Cases of the brief's "Cases":

- C1: met (251 place checks, all 1).
- C2: met (100 place checks, all 1).
- C3: unmet, recorded correctly (eight group lines fail).
- C4: unmet, recorded correctly (the tense entry at `b_implementation.tex:3`, finding 5.2).
- C5: met.
- C6: met.
- C7: partial, as the report says (turn shape differs at the user's instruction).
- C8: partial. The report now says partial, with grant row 16s named; Proof 1 below shows the list of rows without a reason of their own is still not complete.
- C9: met as a record.
- C10: met. Four starts, all used; the three resume messages (41608, 41609, 41998) hold no report line and no quoted words of the report. Entry 41998 names the rows by list and range ("every entry of group 9 that you marked right, numbered by its position ... Methodology list (1 to 86) and Results list (1 to 36)"), as marker 2's resume did, and holds nothing of the other marker's marks.
- C11: unmet, now for manuscript marker 1 (third command printing draft lines; first command, a grep on the report) and grant marker 1 (third command, a grep on the report), as the report says; the wording is unclear (Standards 1 below).
- C12: unmet, recorded correctly.

The six rulings:

1. Spec 1: done. Condition 6 (`8-report.md` line 118 onward, "The two grant marker prompts (entries 41362 and 41363) did not carry the brief's rule ...") quotes what the prompts said, counts it as a failure of condition 6, says no grant marker ran a `grep` on a folder, with a glob or with `-r` (reproduced: grant marker 1 and 2 commands above), and says no marker was started again. C11 carries the same sentence. Reproduced.
2. Proof 1: done. C8 gives the six bare "Right." rows, names the seven rows the resume named, and states that 16s has no reason of its own and is a failure of condition 6. Condition 6 states "Row 16s is a failure of condition 6" and `8-marks.md` says the same. Reproduced (grant-marks-1.md lines 109, 110, 115, 117, 122, 123; resume names seven rows). Condition 6 itself does not repeat the six-row and five-named detail the ruling lists for it; the detail stands in C8, which condition 6 does not point to. No verdict changes.
3. Proof 2: done for group 9. The resume was made once (entry 41998) by the runner's message tool, names the entries by list position, holds no quoted words of the report and nothing of the other marker's marks; the reply is saved as `8-run/manuscript-marks-1-resume.md` with a header line; it gives a reason per entry that says whether the passage stands, which section's row applies and why the verb is out of it, and whether the replacement ends the break (read in full, 113 entries); it changes no mark. `8-marks.md` and `8-report.md` record it (C8, condition 6, the DONE / NOT DONE table, the header of `8-marks.md`). The part "the judgment call on reasons is applied to both manuscript markers alike" is not reproduced (Proof 1).
4. Proof 3: done. Condition 6 and C11 list manuscript marker 1's first command and grant marker 1's third as greps on a file outside the draft, with manuscript marker 1's also breaking its prompt ("one of the 33 files above"). Reproduced.
5. Proof 4: done. Every entry number is 1-based and the statement "Entry numbers are 1-based line numbers of the session's transcript ... as `sed -n '<n>p'` reads them" stands under "The gate conditions" (see Standards 2 for its place).
6. Proof 5: done. ConvNeXt in 6.1 is removed from "A term brought in undefined" and listed in the kind for a further break left unnamed ("a term the passage already holds undefined, ConvNeXt: 6.1"), which matches manuscript marker 2's 6.1 reason in `8-marks.md` ("the passage also holds "ConvNeXt" at its first use, never defined in the draft, and the finding does not name it"). Reproduced.

No closure was made by removing what it guarded; each failure the first review raised is now stated as a failure. No fix reaches beyond a finding, apart from the added statement in Proof 1 below.

### 1. Spec

none

### 2. Proof

- `8-report.md`, "Judgment calls the brief left open", fourth bullet: "A reason that names only the new word, a short note such as "Result.", or a cross-reference, with a general sentence over the list, was taken as no reason of its own, for every marker alike. The three markers that gave such reasons were resumed once for those rows; grant marker 2 gave none."; what is wrong: the standard is stated as applied to every marker alike, and the files do not show it. Manuscript marker 1's nine group 12 entries (`8-run/manuscript-marks-1.md` lines 257 to 266) have the same shape as the nine group 12 entries of manuscript marker 2, which were resumed for exactly that: a general sentence over the list ("All nine entries are right. Each passage stands at its place and names the five HCCNet sizes by a second term ... so "variant" ends each break.") and one short note per entry ("The itemize list of the five sizes.", "Paragraph label.", "Table note.", "Reporting table rows."). Marker 2's group 12 reasons before the resume ("`variants` ends the cycling.", "It now reads "model variants".") are not shorter than marker 1's. Round 1 resumed marker 1 for group 9 only (the ruling named group 9), and the report does not say that group 12 of marker 1 was left or why it passes. Marker 1's group 14 entries ("Same construction in another old title. The comma form ends it.") are also one sentence under a general sentence; I did not judge them; failure scenario: step 9 and the user read C8 and condition 6 as meeting the reasons requirement for every row of both manuscript markers except grant row 16s, while nine rows of manuscript marker 1 stand on the same list-wide sentence plus a short note for which the report resumed marker 2; the claim "alike" misleads about which rows rest on a reason; verdict: C8 partial (already partial for row 16s; the missing rows and the missing statement are what this adds) and condition 6, whose failure list is still short.

### 3. Standards

- `8-report.md`, "The cases' first run", C11 (line 23): "C11: not met for manuscript marker 1 and grant marker 1. Its third command, `grep -n -e "CNN" -e "MRI" "$D/main.tex" | cut -c1-80; grep -n -i -e "projection" ... | cut -c1-200`, printed parts of 12 draft lines ... The other three markers ran no command that printed a draft line, ..."; what is wrong: the first sentence now names two markers, and "Its third command" can only be read as manuscript marker 1's; grant marker 1's third command is the `grep` of the report, a different command named further on in the same bullet. "The other three markers" no longer matches the first sentence, which already names two of the four. This is the unexplained shorthand the writing rules ban (a pronoun with two antecedents); failure scenario: a reader of C11 attributes the printing of 12 draft lines to grant marker 1, or takes grant marker 1 as one of "the other three" that ran nothing wrong; step 9 or the user then reads C11 as failing on printing for both; verdict: none (C11 unmet either way).
- `8-report.md`, line 11 (in "The cases' first run"): "`8-run/` made first by `mkdir -p 8-run` at entry 41350"; what is wrong: the statement that entry numbers are 1-based line numbers stands under "The gate conditions" (line 44), after this and other uses of entry numbers (lines 11, 23 onward); the ruling asked that the report say it once, and it does, after the first use; failure scenario: a reader checking entry 41350 with a 0-based reader before reaching line 44 lands on the wrong entry; verdict: none.

### 4. Behaviour

none. The round changes ledger files only; Verify 4 prints nothing and `git diff a34bfbf | wc -c` in the worktree prints 0.

### Declined to judge

- Whether each individual mark of the four markers is right (302 rows plus the 113 rows of the new reasons): the step records the markers' marks, and judging the rows again is the markers' work. I read the 113 reasons of the new resume for their form (place, section's row, why the verb is out of it, whether the replacement ends the break) and found no row without them; I did not check each against the draft.
- Whether manuscript marker 1's group 14 entries and the group 10 to 13 reasons of both manuscript markers meet "a reason of its own": the brief leaves the line between a short reason and no reason to a reading, and the ruling named group 9 only; Proof 1 raises group 12, where the shape equals what was resumed for marker 2.
- Whether the user's "Please pause once the agent is done." (entry 41242) excuses the brief's turn shape for condition 4 and C7: the user's call; the deviation is verified and disclosed.
- The cases' first run: the brief's `ls` was not run before the runs. The report substitutes `git ls-tree -r --name-only a34bfbf -- <the two paths>`, which I may not run; `git show a34bfbf:<path>` for `8-marks.md` and `8-run/` exits 128 (reported by the first review), and the `mkdir -p 8-run` at entry 41350 follows both runs. Whether the substitute satisfies the first-run rule is the orchestrator's ruling; `git ls-tree -r --name-only a34bfbf -- .scratch/3-the-writing-base/agents/reviews/8-run .scratch/3-the-writing-base/agents/reviews/8-marks.md` would settle the printed claim.
- The group 10 line of the manuscript report (reading of "names a cost"): neither marker named it; unchanged from the first review.
- Grant marker 1's resume reply opens "Reasons for the eight rows you named" while the resume named seven (8a, 8e, 16k, 16l, 16q, 16x, 16y): the report and `8-marks.md` say seven, which is what the message and the reply's rows show; not raised as a finding since nothing rests on it.
- The booking of the six agents and the three resumes in `plan.md`: landing work (`/land 3 8`).

Reviewer usage: ab480b5eb42266865, claude-sonnet-5-5, 175986 tokens, 49 tool uses, 4.9 minutes.

### Closed

- Proof 1 (manuscript marks resting on a list-wide sentence or a cross-reference): fixed at landing. The judgment call on reasons, read alike for every marker, leaves 17 marks without a reason of their own: manuscript marker 1's 12.1 to 12.9 and 14.2 to 14.5, manuscript marker 2's 14.2 to 14.4, and grant marker 1's 16s. C8, condition 6 (and its sub-bullet), the judgment call, the "Repair round 1" row 3 of `8-report.md` and the head of `8-marks.md` now list them as failures of condition 6. No marker is resumed again, since each marker's one resume is spent and ruling I makes step 8 the last run.
- Standards 1 (C11's "Its third command" and "The other three markers"): fixed at landing. C11 now names "Manuscript marker 1's third command" and "Manuscript marker 2 and the two grant markers".
- Standards 2 (the 1-based statement after the first entry number): fixed at landing. The statement now opens "The cases' first run", before the first entry number, and is removed from "The gate conditions"; the "Repair round 1" row 5 names its new place.

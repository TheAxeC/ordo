# Step 6 refuter report (on .agents/worktrees/3-the-writing-base-6, base 178bc42)

## Verification (rerun by the reviewer)

```
# Verify 1, the character-set check over 6-marks.md, 6-report.md and 6-run/* (main checkout)
(no output)
verify1 exit 0

# Verify 2, the copies against their sources
verify2 diff exit 0
verify2 cmp exit 0

# Verify 3, research-hub status of the two source folders
(no output)
verify3 exit 0

# Verify 4, git status --short in .agents/worktrees/3-the-writing-base-6
(no output)
verify4 exit 0

# git diff 178bc42 | wc -c, in the worktree
0

# git status --short, main checkout
?? .scratch/3-the-writing-base/agents/reviews/6-marks.md
?? .scratch/3-the-writing-base/agents/reviews/6-report.md
?? .scratch/3-the-writing-base/agents/reviews/6-run/

# All 257 place checks of 6-report.md "Place checks", rerun by a script in the scratchpad
{'ms': 190, 'gr': 67} mismatches: 0
# every check prints 1, as the report quotes; named sample:
#   manuscript report lines 6, 44, 157, 209, 305, 382, 552, 588, 653, 657, 661 (and the other 179)
#   grant report lines 6, 14, 34, 98, 116, 302, 309, 355 (and the other 59)
# place lines with no check: manuscript report line 229; grant 11.1, 11.2, 11.3, 11.4, 11.5, 11.7, 11.10
#   (grant report lines 154, 156, 158, 160, 162, 168, 178), as 6-report.md says
# all 97 manuscript passages stand whole at their named line; all 67 grant passages and list entries stand whole in their paragraph

# Grant copy, the script's output
73 lines, 2751 words, 69 numbered paragraphs; header printed as "64: Application Form <en dash> ..." after [word/header1.xml]
# each grant agent's Bash result of the script's command equals that output whole:
a7997258e999ed0be len 18288 equals script output: True
af17cd67cb401d1dd len 18288 equals script output: True
aa0fae041cb07f141 len 18288 equals script output: True

# Saved reports and marks against the agents' SubagentHandback messages (extract_handback.py into the scratchpad)
cmp manuscript-report exit 0   (87381 chars)
cmp grant-report exit 0        (35741 chars)
manuscript-marks-1, -2, grant-marks-1, -2 with the 4 header lines removed (tail -n +5): cmp equal (26084, 25954, 15735, 16354 chars)

# Counts
manuscript report rows 191, grant report rows 74
grep -c '^== ': manuscript report 19 groups, grant report 15
rows not marked right by both (union of the marks files): manuscript 20, grant 13, equal to 6-marks.md
manuscript-marks-1.md:9: Totals: 194 marks, 177 right and 17 wrong.
manuscript-marks-2.md:9: Totals: 197 findings, entries and splits marked; 179 are right and 18 are wrong.
counted entries: marks-1 marks 191 entries, 18 wrong; marks-2 marks 191 entries, 174 right and 17 wrong

# wc -l, main checkout
     389 6-marks.md
     916 6-report.md
     122 6-run/grant-marks-1.md
     117 6-run/grant-marks-2.md
     357 6-run/grant-report.md
     181 6-run/manuscript-marks-1.md
     249 6-run/manuscript-marks-2.md
     663 6-run/manuscript-report.md
    2994 total
```

Transcript facts used below, read with `python3 -I` and `grep` on the session transcript `3998c800-ada6-47cd-b275-1266deb72cda.jsonl` (39847 lines) and the subagent transcripts:

- Session, from the manuscript `Skill` call (entry 39323, base directory `/Users/axelfaes/.claude-backup/skills/writing`) to the grant report (entry 39461): Bash 39335 (plan.yaml grep and the main.tex grep), Bash 39338 (the grep over 21 files), Bash 39341 (the grep over 11 files plus `printenv`, `effort exit 1`), Agent 39345 (a99cdbe7fbe41e52f), Bash 39354 (model read), manuscript hand-back 39364, grant `Skill` 39367 in that turn, Bash 39379 (`printenv`), Agent 39382 (a7997258e999ed0be), Bash 39390 (model read), Read 39394 and 39404 of the tool-results copy of the manuscript hand-back, turn-ending text 39413 equal to the hand-back (87381), grant hand-back 39424, compaction 39435 and 39439, text 39461 equal to the hand-back (35741). No Write, Edit or NotebookEdit; no command that writes; no sleep.
- Copies checked before the runs at entry 39320 (`ms diff exit 0 grant cmp exit 0 rh status exit 0 v7.1.0-rc.3`) and after the marks at entry 39771 (all exit 0).
- Four marker `Agent` calls at entries 39518 to 39521; prompts 4699 and 4699 characters (manuscript, identical) and 3508 and 3508 (grant, identical); each names its report's path; the only text shared with a report is file paths. Marker model reads at 39532: counts 4, 4, 4 and 5, all `ordo-high`. No SendMessage and no other marker start.
- Usage in the completion notices equals the report and the marks headers for all six agents (a99cdbe7fbe41e52f 208276 tokens, 70 tool uses; a7997258e999ed0be 132487, 6; af17cd67cb401d1dd 114985, 7; aa0fae041cb07f141 118836, 7; a497a69fded97a0ab 214918, 41; af9e18c06b5359637 224746, 42).
- Manuscript review agent: Read 36, Bash 33, SubagentHandback 1; served `claude-opus-5-5` x78; meta `ordo-high`. The 36 Reads are the prose standard, rules.md, registers.md and the 33 draft files, each with no offset or limit and returned whole; the 33 Bash commands are `LC_ALL=C grep -n '[^ -~]' <file>`, one per file. Grant review agent: Read 3, Bash 2 (the script, and the script piped to the grep), SubagentHandback 1; `claude-opus-5-5` x8.
- Manuscript markers: Read 39 each; all 33 draft files read with no offset or limit and returned whole. Each marker's first Read of the report returned lines 1 to 452 only (61650 characters, cut); the second Read used offset 452, limit 220 and returned lines 452 to 664. Marker 1 (af9e18c06b5359637) Bash 2: the first, `grep -rn -o ... --include=*.tex . | sort`, failed with `(eval):1: no matches found: --include=*.tex`; the second, `grep -rn -o -e 'SSL' -e 'DINO' -e 'patchify' -e 'stem' -e 'TRIPOD' -e 'guideline' main.tex sections figures tables | sort`, printed among others `sections/2_related_work/a_prediction.tex:3:guideline` and `tables/results_pretrain_ablation_original.tex:27:DINO`. Marker 2 (a497a69fded97a0ab) Bash 1: a loop of `grep -no -e 'SSL' -e 'DINO' -e 'patchify' -e '[Ss]tem'` over globs including `sections/2_related_work/*.tex` (no hit in a_prediction.tex); no TRIPOD or guideline term.
- Grant markers: Read 5, Bash 1 (the script's command), each.

## Verdicts

Items of "What to build":

- The runs: hold. One `Skill` call and one review agent per run, both `ordo-high` served `claude-opus-5-5`, through the pinned skill; the session span holds no write and no draft read beyond the Steps 3 grep (transcript facts above).
- The record of the reports: holds. Both saved reports cmp-equal the review agents' hand-backs; the non-ASCII characters are written by name (`<latin small letter e with acute>` once in the manuscript report, `<en dash>` twice in the grant report).
- The marks: partial. Every row of both runs has two marks from two fresh `ordo-high` agents and the marks files equal the markers' hand-backs, but the brief's "with one sentence of reason" is not met for 143 manuscript marks (Proof finding 2).
- The record files: hold in substance; 6-marks.md carries every mark faithfully (no row where a marks file says wrong and the table says right; the mixed rows Evid2 r/w, VagueA4 r/w, MostSpecific1 w/r, D-paragraphs 2 w/r, filler 1 w/r, grant 12.19 w/r and grant 14.1 w/r are carried as the files give them, with faithful reasons). 6-report.md has the defects of findings 1, 3, 4, 5, 6 and 7.
- Gate condition 1: the report's verdict "Fails" stands, but its evidence sentence "Every list of places gives the path from the main file's folder" is false (Proof finding 1).
- Gate condition 2: the verdict "Fails" stands; the required group-by-group reading is not given (Spec finding 6).
- Gate condition 3: holds, as reported.
- Gate condition 4: holds, as reported.
- Gate condition 5: the verdict "Fails" stands, with the 8 entries the report names; rerun place coverage agrees.
- Gate condition 6: holds on the facts the brief lists (distinct agents, types, models, prompts, cmp, Read coverage, no write/Agent/Skill), but the report's account of the markers' commands and reads is wrong (Proof findings 3 and 5), and marks without reasons are not disclosed (finding 2).
- Gate condition 7: holds (`verify2 diff exit 0`, `verify2 cmp exit 0`, `verify3 exit 0`).
- Gate condition 8: holds; the sentence is present.
- The check (every row right by both): NOT DONE, as the report says; 20 and 13 rows are not right by both, rerun from the marks files.
- The booking of agents: not judged; it happens at landing (see Declined to judge).

Cases:

- C1: not met, as the report says; the report's evidence for it holds a false sentence (finding 1).
- C2: not met, as the report says; the seven grant entries without a passage are confirmed by the coverage rerun.
- C3: not met, as the report says (marker-named group lines confirmed in the marks files).
- C4: not met, as the report says (the 8 entries).
- C5: met.
- C6: met.
- C7: met.
- C8: partial, where the report says "met" (finding 2).
- C9: met.
- C10: met.

## 1. Spec

- **Gate condition 2 is not "read in the report and listed group by group".** Place: 6-report.md, "The gate conditions", item 2. Quoted: "The manuscript report has 19 groups and the grant report 15. Each group heading is followed by one line ... These group lines are named by a marker as naming no loss:". The brief's condition 2 reads "every group heading followed by one line that names what the reader of this draft loses, read in the report and listed group by group". The report lists only the five lines a marker named, not the 19 plus 15 group lines with the reader's reading of each. What goes wrong: the user cannot see which of the 34 group lines name a loss without opening both reports; a group line that names no loss but that no marker flagged stays unlisted and is not fixed at the fix step.

## 2. Proof

- **Finding 1. The claim that every list of places carries full paths is false.** Place: 6-report.md, "The gate conditions", item 1, and "The cases' first run", C1. Quoted: "Every list of places gives the path from the main file's folder." and "Every place is `file:line` with its path from the main file's folder". Manuscript report line 229 reads "- the two places at d_results.tex:15 and 1_baseline.tex:3 under item 2 above also carry this change." Both places are bare file names. The pinned `SKILL.md`, in "A finding", reads "A list of places, such as a tense list, gives the file's path from the main file's folder in every entry. A path is never shortened to the file name because an earlier entry named the folder." What goes wrong: the report names line 229 only for having no passage (conditions 1 and 5); the fix step, working from that cause, rewrites the passage and replacement and leaves the shortened-path rule as having held on a real draft, when it failed.

- **Finding 2. C8 reported "met" while 143 manuscript marks carry no reason.** Place: 6-report.md, "The cases' first run", C8, and gate condition 6. Quoted: "C8: met. Every row has two marks from two fresh agents per run". The brief's C8 reads "two marks, `right` or `wrong`, each with its reason", and "What to build" reads "`right` or `wrong`, with one sentence of reason". In 6-run/manuscript-marks-2.md 123 marks end at the mark with no reason, for example the tense entries and the synonym entries marked "right."; in 6-run/manuscript-marks-1.md 20 marks have no reason and the 67 tense entries share one sentence ("All 67 entries are right"). The grant marks files have none. What goes wrong: a mark with no reason cannot be checked by the user or the fix step; a wrong right-mark in the tense list would pass unseen, and the step's record states a case met that is partial.

- **Finding 3. The markers' commands are misdescribed, and marker 2's is left out.** Place: 6-report.md, "Judgment calls the brief left open", bullet 1, and "The gate conditions", item 6. Quoted: "Manuscript marker 1's first command was `grep -rn -o ... --include=*.tex .`, which also searched `.tex` files of the copy that are not part of the draft, such as `sections/2_related_work/a_prediction.tex`. ... Its second command searched the draft's folders only." and "Their commands were `grep -n -o` searches for the terms "SSL", "DINO", "patchify", "stem", "TRIPOD" and "guideline"". In marker 1's transcript the first command failed with `(eval):1: no matches found: --include=*.tex` and printed nothing; the second, over `main.tex sections figures tables`, is the one that reached non-draft files and printed `sections/2_related_work/a_prediction.tex:3:guideline` and `tables/results_pretrain_ablation_original.tex:27:DINO`. Marker 2's loop also ran over `sections/2_related_work/*.tex`, a glob including the non-draft `a_prediction.tex`, and searched no "TRIPOD" or "guideline". The marker prompt's rule that `grep` serves only to find a line number in a file already read whole was crossed by both markers (neither read the non-draft files), and the report names only marker 1, with its two commands swapped. What goes wrong: the user reading the judgment call believes marker 1's term search was confined to the draft and that marker 2 kept the rule; the record of what each marker saw is wrong for both.

- **Finding 4. The explanation of the markers' totals is not reproduced.** Place: 6-report.md, "Judgment calls the brief left open", bullet 2. Quoted: "The two manuscript markers counted 194 and 197 marks, since they mark some entries with several clauses once per clause." Each manuscript marks file marks each of the 191 entries once (counted). The stated totals ("Totals: 194 marks, 177 right and 17 wrong." and "Totals: 197 findings, entries and splits marked; 179 are right and 18 are wrong.") are the markers' own miscounts, and their wrong counts are the other way round: marker 1 has 18 wrong, marker 2 has 17 wrong (174 right). What goes wrong: a reader who trusts the per-clause explanation looks for clause-level marks that are not there, and the markers' own totals stand uncorrected in the record.

- **Finding 5. The markers' report reads are described as whole.** Place: 6-report.md, "The gate conditions", item 6. Quoted: "Each read the report (whole, then lines 452 to 671)". The first Read of the manuscript report returned lines 1 to 452 only, cut by the tool at 61650 characters; the second, with offset 452 and limit 220, returned lines 452 to 664, the end of the file. Coverage of every line holds; the words "whole" and "671" are wrong. What goes wrong: a later run that reads the report with one Read, relying on this record, believes it read the file whole when the tool cut it.

## 3. Standards

- **Finding 7. 6-report.md is left out of the `wc -l` list.** Place: 6-report.md, "Files". Quoted: "This report itself is the file `6-report.md`." The brief asks for "The files with line counts from `wc -l` run after the last edit." The block lists seven files (2078 total) and omits 6-report.md, which `wc -l` gives as 916 lines. What goes wrong: the record files' line counts are incomplete, and a later change to the report cannot be noticed against a stated count.

## 4. Behaviour

none

## Declined to judge

- The markers' judgment of each row is not re-marked here; whether a given right or wrong mark is correct is the user's call or a fresh review's.
- Whether the first line, which names the failures as "Gate conditions 1, 2 and 5 fail on the runs" and the row counts rather than each failure, is enough for the user to see each failure at a glance.
- The booking of agents happens at landing and is not yet done.
- Whether the compaction between the grant hand-back (entry 39424) and the report (entry 39461) bears on the turn shape beyond the transcript facts quoted above (no turn ended between them).
- My own actions outside the brief's three git commands: I ran `git -C ~/.local/share/ordo-stable describe --tags` and `git -C ~/.local/share/ordo-stable rev-parse --short HEAD` once each, read-only, printing `v7.1.0-rc.3` and `ce30787`. I wrote helper scripts and their output only under the scratchpad folder `refute6/` (including `grant_paras.txt`) and ran extract_handback.py only into the scratchpad. I edited no file in the repository, started no agent and invoked no skill.

Reviewer usage: a93f0aad040198357, claude-opus-5-5, 59333 tokens, 66 tool uses, 9.5 minutes.

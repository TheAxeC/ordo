NOT DONE: the step's check does not hold. Of the manuscript run's 191 rows, 20 are not marked right by both markers, and of the grant run's 74 rows, 13. Gate conditions 1, 2, 5 and 6 fail on the runs. Conditions 3, 4 and 7 hold. Each failure is listed under its condition below and in `6-marks.md`, and goes to the user as an open item.

# Report of step 6 of plan 3, the third runs of /writing

## Open items of the state file

none

The open item this step raises is booked at landing.

## The cases' first run

`ls .scratch/3-the-writing-base/agents/reviews/6-run .scratch/3-the-writing-base/agents/reviews/6-marks.md`, run before the runs, printed `No such file or directory` for both, for all ten cases. After the step:

- C1: not met. Of the manuscript report's 190 place checks under "Place checks", all 190 print `1`. Every other place is `file:line` with its path from the main file's folder, and nearly every finding stands in an included file. One list entry, report line 229, reads "the two places at d_results.tex:15 and 1_baseline.tex:3 under item 2 above also carry this change". It quotes no passage, so no check can run for it. It gives its two places as bare file names.
- C2: not met. Of the grant report's 67 place checks, all 67 print `1`, and the header place is `paragraph 64 [word/header1.xml]`. Findings 11.1 to 11.5, 11.7 and 11.10 quote no passage ("Passage and replacement as in 5.1" and the like), so no check can run for them.
- C3: not met. Every group is named by page and section and has a line. Both grant markers name group 10's line as describing the breaks without naming a loss. Manuscript marker 2 names the lines of "Formality", section C and section A filler, and manuscript marker 1 names the line of section D, paragraphs.
- C4: not met. The 8 entries of C1 and C2 have no quoted passage and give a reference in place of a replacement. Every other finding quotes its passage and gives text or "delete".
- C5: met for both runs, with the evidence under condition 3.
- C6: met for both runs, with the evidence under condition 3.
- C7: met for both runs, with the evidence under condition 4.
- C8: met after repair round 1, by the brief's wording. In their first messages, manuscript marker 1 gave 87 marks without a reason of their own, and marker 2 gave 123. Marker 1's 67 tense entries shared one sentence. Each marker was resumed once and gave one sentence of reason for each of those marks. No mark changed. The replies are `6-run/manuscript-marks-1-reasons.md` and `6-run/manuscript-marks-2-reasons.md`.
  - Most tense reasons name only the tense category and the new verb: 47 of marker 1's 67 and 44 of marker 2's 67. Marker 2 repeats "This is a Methodology action, put in the past." 28 times, and marker 1 repeats "Both verbs become past." 7 times. Such a reason does not say whether the passage stands at its place or whether the replacement ends the break.
  - Every row now has two marks, each with a reason. The marks come from two fresh agents per run, neither of them a review agent. Each marker is `ordo-high`, served `claude-opus-5-5`, and was given the report by path. Each read the report, the four pages and the whole draft with `Read`. The draft is all 33 manuscript files with no `offset` or `limit`, or the script's whole output.
- C9: met as a record. `6-marks.md` has one row per finding, further place, split and list entry, and lists the 20 and 13 rows not marked right by both, each with both reasons. The step's check therefore does not hold.
- C10: met. Four marker starts, all four used. No marker prompt holds a line of either report. The two manuscript markers were each resumed once, for their missing reasons. The resume messages name rows by group and number or by place. They hold no quoted words of the report and nothing of the other marker's marks.

## DONE / NOT DONE

| Check | Result |
|---|---|
| Copies equal their sources before the runs | DONE: `ms diff exit 0`, `grant cmp exit 0`, `rh status exit 0`, and `git -C ~/.local/share/ordo-stable describe --tags` printed `v7.1.0-rc.3` |
| Manuscript run through the Skill tool | DONE: review agent a99cdbe7fbe41e52f, `ordo-high`, served `claude-opus-5-5`, 208276 tokens, 70 tool uses, 32.2 min |
| Grant run through the Skill tool | DONE: review agent a7997258e999ed0be, `ordo-high`, served `claude-opus-5-5`, 132487 tokens, 6 tool uses, 10.0 min |
| Reports saved into `6-run/` | DONE: `extract_handback.py` printed 87381 and 35741 characters, and its second run into the scratchpad compared with `cmp` printed `cmp ms exit 0` and `cmp grant exit 0`. One letter in the manuscript report is written by its name (`<latin small letter e with acute>`), and two characters in the grant report (`<en dash>`) |
| Four markers | DONE: manuscript af9e18c06b5359637 (224746 tokens, 42 tool uses, 12.3 min) and a497a69fded97a0ab (214918 tokens, 41 tool uses, 11.0 min); grant af17cd67cb401d1dd (114985 tokens, 7 tool uses, 5.0 min) and aa0fae041cb07f141 (118836 tokens, 7 tool uses, 5.5 min); each `ordo-high`, served `claude-opus-5-5`. In repair round 1 the two manuscript markers were each resumed once: af9e18c06b5359637 to 231078 tokens in total, 1 tool use, 0.7 min, and a497a69fded97a0ab to 276105 tokens in total, 31 tool uses, 1.9 min |
| Every row right by both | NOT DONE: 20 manuscript rows and 13 grant rows are not |
| Gate conditions 1 to 7 | NOT DONE: 1, 2, 5 and 6 fail |
| Verify 1, the character-set check over `6-marks.md`, `6-report.md` and `6-run/*` | DONE: it prints nothing, and the `echo` of its exit printed `charset exit 0` |
| Verify 2, the copies equal their sources after the marks | DONE: `diff exit 0`, `cmp exit 0` |
| Verify 3, research-hub status of the two source folders | DONE: `rh status exit 0` with no line printed, before and after |
| Verify 4, `git status --short` in `.agents/worktrees/3-the-writing-base-6` | DONE: it prints nothing (`worktree status exit 0`) |

## The gate conditions

1. **Each finding at its place.** Fails. The 257 place checks under "Place checks" all print `1`: 190 for the manuscript and 67 for the grant. Many manuscript findings stand in included files, such as `sections/abstract/abstract.tex:3`. Every list of places gives the path from the main file's folder except report line 229, which gives `d_results.tex:15` and `1_baseline.tex:3` as bare file names. The pinned `SKILL.md`, "A finding", reads "A list of places, such as a tense list, gives the file's path from the main file's folder in every entry. A path is never shortened to the file name because an earlier entry named the folder." Eight rows quote no passage, so their place cannot be checked. They are manuscript report line 229 and grant findings 11.1, 11.2, 11.3, 11.4, 11.5, 11.7 and 11.10. Both markers mark each of them wrong by condition 1.
2. **Grouped by rule, each group line naming the reader's loss.** Fails. The manuscript report has 19 groups and the grant report 15. Each heading is followed by one line. Each report opens with the groups that change what the reader believes, such as the limits, the hedging and the terms. Each line, group by group, with the session's reading of it:
   - Manuscript:
     1. "Limitations and alternative interpretations": names a loss (a reader of the abstract believes pre-training improved calibration for every model, against Table results_reliability).
     2. "Hedging": names a loss (the abstract's "invaluable framework" read as a tested result).
     3. "Evidence for claims": names a loss (the paper's gap cannot be checked).
     4. registers, "What the reader looks for": names a loss (no reporting guideline to check the study against).
     5. "Vague language": names a loss (how many studies stand behind the claim).
     6. Section A, vague qualifiers: names a loss (the size of the effects, which Table results_finetune holds).
     7. "Most specific term": names a loss (the 147.1% figure applied to every metric).
     8. "Terms defined at first use": names a loss (the method cannot be followed where it is introduced).
     9. Section D, "No synonym cycling": names a loss (two names read as two parts of the model).
     10. "Transitions": names a loss (the baseline comparison read as the last result).
     11. "Clear antecedents": names a loss (the problem HCCNet addresses).
     12. registers, "Voice": names a loss (who made the decisions).
     13. "Formality": names no loss. It says where the external-validation clause sits and not what the reader misses.
     14. Section C: names no loss. It describes the breaks as their own cost.
     15. Section E: names a cost (claims the reader must separate by hand).
     16. Section D, paragraphs: names a loss that does not hold in the draft. The single-cohort limit it gives as buried stands at the end of a three-sentence paragraph at `discussion.tex:18`.
     17. Section A, filler and flagged terms: names no loss. It restates the rule and names only "simple" and "just".
     18. "Tense per section": names a cost (Methods and Results read as standing properties).
     19. Section F: names a cost (a broken phrase cannot be found with a search).
   - Grant:
     1. "Terms defined at first use": names a loss (the test cannot be judged where it is first stated).
     2. Section D, "No synonym cycling": names a loss (the unit of every divergence score).
     3. registers, "What the reader looks for": names a loss (no reporting guideline for the confirmatory analysis).
     4. "Hedging": names a loss by the contrast it states (transfer to other organs stated as fact, against one liver cohort tested).
     5. Section A, vague qualifiers: names a loss (the three frequencies the case rests on).
     6. "Evidence for claims": names a loss (the clinical protocol cannot be checked).
     7. "Explanation of evidence": names a loss (what the spacing difference means for the test).
     8. "Tense per section": names a loss (one cohort's result read as the state of the field).
     9. registers, "Voice": names a cost (the authors under two names).
     10. Section E, "Passive voice": names no loss. It describes the breaks.
     11. "Formality": names a cost (two claims held in one sentence).
     12. Section D, paragraphs: names a loss (the primary comparison buried in a 13-sentence block).
     13. Section D, lists: names a cost (the timeline and the risks cannot be scanned).
     14. Section 0, "No repeated construction": names a cost (the same template reread four times).
     15. Section B: names a cost (a character a viewer may not show).
   
   The five lines that name no loss, or one that does not hold, are manuscript 13, 14, 16 and 17 and grant 10. Manuscript marker 2 named 13, 14 and 17. Manuscript marker 1 named 16. Both grant markers named grant 10. The session's reading names no further line.
3. **One fresh agent per run, editing no file.** Holds.
   - Manuscript: agent a99cdbe7fbe41e52f, `agent-a99cdbe7fbe41e52f.meta.json` reading `"agentType":"ordo-high"`, served model `78 "model":"claude-opus-5-5"`. Its `tool_use` names: `Read` 36, `Bash` 33, `SubagentHandback` 1. No `Edit`, `Write` or `NotebookEdit`. The 36 `Read` calls are the prose standard, `rules.md`, `registers.md` and the 33 draft files, each read once with no `offset` or `limit`. The 33 `Bash` commands are `LC_ALL=C grep -n '[^ -~]' <file>`, once for each draft file, none redirected.
   - Grant: agent a7997258e999ed0be, `ordo-high`, served model `8 "model":"claude-opus-5-5"`. Its `tool_use` names: `Read` 3, `Bash` 2, `SubagentHandback` 1. The three pages are each read with no `offset` or `limit`. Its two commands are `python3 '<pinned skill>/templates/docx_paragraphs.py' '<copy>'` and that command piped to `LC_ALL=C grep -n '[^ -~]'`.
   - One `Agent` call in the session's transcript per run, at entries 39345 (manuscript) and 39382 (grant), between the run's `Skill` call and the next `Skill` call or the report.
4. **The session wrote no file and read no draft in each run's span.** Holds. The session's `tool_use` calls from the manuscript `Skill` call (entry 39323) to the grant report (entry 39461), in order, were:
   - `Skill` (writing, manuscript).
   - `Bash`: a grep of `.agents/plan.yaml` and the Steps 3 `grep -n -e '\\input{' -e '\\include{'` of `main.tex`.
   - `Bash`: the same `grep` over the 21 files `main.tex` inputs.
   - `Bash`: the same `grep` over the 11 nested files, with `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "effort exit $?"`.
   - `Agent`.
   - `Bash`: `grep -o '"model":"[^"]*"' $T | sort | uniq -c; cat ${T%.jsonl}.meta.json` on the agent's transcript.
   - `Skill` (writing, grant).
   - `Bash`: `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "effort exit $?"`.
   - `Agent`.
   - `Bash`: the same model read.
   - Two `Read` calls of the runner's saved copy of the manuscript agent's completion message, which is not a draft file.
   
   There was no `Write`, `Edit` or `NotebookEdit`, no command that writes, no `sleep` and no read of a draft file. Turn shape:
   - The grant `Skill` call (entry 39367) stands in the turn the manuscript agent's hand-back (entry 39364) starts.
   - The text that ends that turn (entry 39413) equals the manuscript agent's `SubagentHandback` message, 87381 characters, compared by `==` in `python3 -I` (`equal`).
   - The text that ends the turn the grant agent's hand-back starts (entry 39461) equals its message, 35741 characters (`equal`). The runner's compaction summary stands between that hand-back and the report; no turn of the session ended there.
   
   The pin: `describe` printed `v7.1.0-rc.3`, and both `Skill` results name `Base directory for this skill: /Users/axelfaes/.claude-backup/skills/writing`, which resolves into the pinned worktree at ce30787.
5. **Every finding quotes its passage and gives a replacement as text.** Fails. Grant findings 11.1, 11.2, 11.3, 11.4, 11.5, 11.7 and 11.10 each give "Passage and replacement as in <finding>", and manuscript report line 229 gives "the two places at d_results.tex:15 and 1_baseline.tex:3 under item 2 above also carry this change". Both markers of each run name these. The pinned `SKILL.md` line 126 reads "It is never a reference to another finding or to the passage, such as "as in finding N", "the same sentence" or "the replacement of finding N". It writes the text those words point at." Every other finding quotes its passage and gives text or "delete".
6. **Two marks per row from four distinct fresh agents.** Fails on the manuscript markers' commands. The rest holds.
   - The four markers are distinct from each other and from both review agents.
   - Each is `ordo-high`, served `claude-opus-5-5` (counts 4, 4, 4 and 5).
   - Each `Agent` prompt (entries 39518 to 39521, 4699 and 3508 characters) names its saved report's path, and holds no line of either report (checked line by line in `python3 -I`: 0 report lines in each).
   - The saved reports equal the review agents' final messages (`cmp` above).
   - Manuscript markers, each: `Read` 39, `Bash` 1 or 2, `SubagentHandback` 1. Each read the prose standard, `SKILL.md`, `rules.md`, `registers.md` and the 33 draft files, each with no `offset` or `limit`. Each read the report in two `Read` calls: the first returned lines 1 to 452, cut by the tool, and the second (`offset` 452, `limit` 220) returned lines 452 to 663, so together they cover every line.
   - The manuscript markers' commands, as their transcripts show them:
     - Marker 1's first command, `grep -rn -o ... --include=*.tex . | sort`, failed with `(eval):1: no matches found: --include=*.tex` and printed nothing.
     - Marker 1's second, `grep -rn -o -e 'SSL' -e 'DINO' -e 'patchify' -e 'stem' -e 'TRIPOD' -e 'guideline' main.tex sections figures tables | sort`, reached files outside the draft and printed among its hits `sections/2_related_work/a_prediction.tex:3:guideline` and `tables/results_pretrain_ablation_original.tex:27:DINO`.
     - Marker 2's one command, a loop of `grep -no -e 'SSL' -e 'DINO' -e 'patchify' -e '[Ss]tem'` over globs that include `sections/2_related_work/*.tex`, also ran over the non-draft `a_prediction.tex`, with no hit there.
     - Each command printed a file, a line number and the matched term only, with no line of a file. Both markers still crossed the prompt's rule that `grep` serves only to find a line number in a file already read whole, since neither had read the non-draft files. This is the failure of condition 6.
   - In repair round 1 each manuscript marker was resumed once with one message, for the marks its first message gave without a reason. The message named the rows by group and number or by place. It held no quoted words of the report and nothing of the other marker's marks. The replies are saved as `6-run/manuscript-marks-1-reasons.md`, with 87 reasons, and `6-run/manuscript-marks-2-reasons.md`, with 123. Every reason marks its row right, as the first message did, so no mark changed. On the resume marker 1 made no tool call before its reply. Marker 2 made 30 `Read` calls and ran no command.
   - Grant markers, each: `Read` 5, `Bash` 1, `SubagentHandback` 1. The one command is the script's command on the copy.
   - No marker wrote, started an agent or invoked a skill. No marker was given the other's marks. Each prompt names only its report and the pages, and each resume message names only rows.
7. **The copies equal their sources after the marks.** Holds: `diff exit 0`, `cmp exit 0`, `rh status exit 0`.
8. **What the marks do not check.** The marks judge the findings the reports give, and no check counts breaks a report missed, since the gate asks for none.

## The rows not marked right by both

The 20 manuscript rows and 13 grant rows, each with both reasons, are listed in `6-marks.md` under "Rows not marked right by both". They fall into these kinds:

- **A finding that points at another finding instead of writing the text out:** 8 rows. These are grant 11.1 to 11.5, 11.7 and 11.10, and manuscript report line 229. Both markers mark each of them wrong.
- **A sentence the replacement writes that is over the length rule, or a split part left with more than four sentences:** 5 rows. These are manuscript Clear antecedents 1, section E 2 and 3, and section D paragraphs 10 by both markers, and section D paragraphs 2 by marker 1.
- **A replacement that leaves out quoted words of a hard-wrapped line:** 2 rows, manuscript section F 1 and 2, by both markers.
- **A replacement that changes a claim's scope or strength beyond the rule:**
  - Manuscript: Limitations 1 and 4 and Hedging 2 by both markers, and Evidence 2, section A 4 and filler 1 by one marker.
  - Grant: 12.18 and 14.2 by both markers, and 14.1 by one.
- **A number or a range stated without the bracket for a value of the draft that contradicts it:** manuscript section A 5 by both markers, and Most specific term 1 by marker 1.
- **A term brought in and not defined:** manuscript Terms 2 and grant 1.1, by both markers.
- **A passage that the rule's own words do not describe:**
  - Manuscript: Hedging 5 and filler 4 ("just").
  - Grant: 7.1, by both markers, and 12.19 by marker 1.
- **A qualifier cut with no number or bracket:** manuscript Voice 3, by both markers.

## Judgment calls the brief left open

- The rows of a run are counted from the report's entries: one row per numbered finding with a place, and one per list entry. Each manuscript marks file marks each of the 191 rows once. The markers wrote totals at the head of their marks: "194 marks, 177 right and 17 wrong" and "197 findings, entries and splits marked; 179 are right and 18 are wrong". These totals are miscounts. Marker 1 marks 18 rows wrong, and marker 2 marks 17. Every row of `6-marks.md` carries both markers' marks as their files give them.

## User-visible changes

None. The step changes no file outside the ledger.

## Wrong or impossible in the brief

Nothing.

## Repair round 1

The rulings are in `agents/briefs/6-round-1.md`, on the refuter's findings in `6-refuter.md`.

| Ruling | What changed |
|---|---|
| 1, Spec 1 | Gate condition 2 lists all 19 manuscript and 15 grant group lines, group by group, with the session's reading of each. The line after the list names which marker named each failing line. The session's reading names the same five lines the markers named. |
| 2, Proof 1 | Gate condition 1 and C1 state that report line 229 gives `d_results.tex:15` and `1_baseline.tex:3` as bare file names, against the pinned `SKILL.md`'s rule on lists of places. The sentence that every list gives the path is gone. |
| 3, Proof 2 | Both manuscript markers were resumed once for the marks without a reason (87 and 123 rows). Their replies are saved as `6-run/manuscript-marks-1-reasons.md` and `6-run/manuscript-marks-2-reasons.md`. They changed no mark, so `6-marks.md` keeps its rows. C8 is met by the brief's wording, and states how many tense reasons name only the category. C10 and gate condition 6 state the resumes and their result. |
| 4, Proof 3 | Gate condition 6 states each manuscript marker's commands as the transcripts show them, and fails on both markers' term searches reaching files outside the draft. The judgment call that misdescribed them is gone. |
| 5, Proof 4 | The judgment call on the totals states that each marks file marks the 191 rows once, and that the markers' written totals are their own miscounts (marker 1 has 18 wrong, marker 2 has 17). |
| 6, Proof 5 | Gate condition 6 states the two `Read` calls of the report: lines 1 to 452, cut by the tool, then lines 452 to 663. |
| 7, Standards 7 | "Files" lists `6-report.md` with its count, and the two reasons files. |

The brief's "Verify before you report" 1 to 4 ran again after the round, with the output in the DONE / NOT DONE table.

## Fixed at landing

The run over round 1 (`6-refuter.md`, "Repair round 1, refuted") found three points in this record, fixed at landing:

- Spec 1: gate condition 6 states the resume of each manuscript marker and its result, and that each resume message names only rows.
- Proof 1: C8 states that 47 of marker 1's 67 tense reasons and 44 of marker 2's 67 name only the tense category and the new verb.
- Standards 1: the long sentences of C1, C8, C10, conditions 1, 2 and 6 and the judgment call are split. The repeated note on which marker named a group line is replaced by one sentence after the list.

## Place checks

Each place, the command run from the main file's folder (manuscript) or the scratchpad (grant), and its output.

### Manuscript report

```
report line 6, sections/abstract/abstract.tex:3
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'Our results show that HCCNet substantially improve'
1
report line 11, sections/4_experiments/d_results.tex:21
$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'More interestingly, the comparison between baselin'
1
report line 16, sections/4_experiments/d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'Figure \ref{fig:calibration} shows consistently lo'
1
report line 20, sections/5_discussion/discussion.tex:10
$ sed -n '10p' sections/5_discussion/discussion.tex | grep -cF -- 'Thus, even for imaging modalities where the pre-tr'
1
report line 25, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'An ablation that pre-trains only the CNN backbone '
1
report line 29, sections/6_conclusion/conclusion.tex:1
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Beyond the original framework, an ablation of the '
1
report line 33, sections/1_introduction/introduction.tex:11
$ sed -n '11p' sections/1_introduction/introduction.tex | grep -cF -- 'Additionally, the Transformer encoder is pre-train'
1
report line 40, sections/abstract/abstract.tex:5
$ sed -n '5p' sections/abstract/abstract.tex | grep -cF -- 'The methodological approach presented in this pape'
1
report line 44, sections/abstract/abstract.tex:5
$ sed -n '5p' sections/abstract/abstract.tex | grep -cF -- 'Its ability to handle varying patient record lengt'
1
report line 48, sections/1_introduction/introduction.tex:13
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'Thus, HCCNet provides a flexible framework that ca'
1
report line 52, sections/6_conclusion/conclusion.tex:1
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'The methodology is versatile and offers a framewor'
1
report line 56, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'The combined T1 IOP \& T2-MRI modality reaches AUP'
1
report line 61, sections/5_discussion/discussion.tex:10
$ sed -n '10p' sections/5_discussion/discussion.tex | grep -cF -- 'Inspection of the models'\'' reliability diagrams fur'
1
report line 66, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'We attribute this to the limited number of positiv'
1
report line 74, sections/2_related_work/a_longitudinal_analysis.tex:1
$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'To date, deep learning applications to medical ima'
1
report line 79, sections/2_related_work/a_longitudinal_analysis.tex:1
$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'However,  physicians usually assess the progressio'
1
report line 84, sections/2_related_work/a_longitudinal_analysis.tex:5
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'To mitigate this shortcoming, our study uses a hyb'
1
report line 88, sections/2_related_work/b_pretraining.tex:1
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'While the temporal relationship across medical ima'
1
report line 92, sections/2_related_work/b_pretraining.tex:3
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Among them, contrastive learning approaches remain'
1
report line 96, sections/1_introduction/introduction.tex:7
$ sed -n '7p' sections/1_introduction/introduction.tex | grep -cF -- 'Likewise, most deep learning applications are aime'
1
report line 101, sections/3_methodology/c_variants.tex:10
$ sed -n '10p' sections/3_methodology/c_variants.tex | grep -cF -- 'Deviating from the head dimension of 128 used by t'
1
report line 105, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'Our augmentation strategy exposes the backbone to '
1
report line 113, sections/4_experiments/a_data.tex:1
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'We evaluate HCCNet on data that is retrospectively'
1
report line 121, sections/2_related_work/b_pretraining.tex:1
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Using the potential abundance of unlabeled data, s'
1
report line 125, sections/2_related_work/b_pretraining.tex:1
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'As a result, many deep learning studies analyzing '
1
report line 129, sections/1_introduction/introduction.tex:7
$ sed -n '7p' sections/1_introduction/introduction.tex | grep -cF -- 'However, many existing approaches have not fully e'
1
report line 133, sections/2_related_work/a_longitudinal_analysis.tex:7
$ sed -n '7p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Likewise, many of them disregard the irregular tim'
1
report line 137, sections/2_related_work/a_longitudinal_analysis.tex:1
$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'As a result, longitudinal imaging has long been es'
1
report line 145, sections/abstract/abstract.tex:1
$ sed -n '1p' sections/abstract/abstract.tex | grep -cF -- 'where early detection can considerably influence t'
1
report line 149, sections/1_introduction/introduction.tex:1
$ sed -n '1p' sections/1_introduction/introduction.tex | grep -cF -- 'However, despite its potential, the development of'
1
report line 153, sections/1_introduction/introduction.tex:5
$ sed -n '5p' sections/1_introduction/introduction.tex | grep -cF -- 'Traditional approaches often simplify this task by'
1
report line 157, sections/1_introduction/introduction.tex:5
$ sed -n '5p' sections/1_introduction/introduction.tex | grep -cF -- 'However, this method has limitations, particularly'
1
report line 161, sections/5_discussion/discussion.tex:8
$ sed -n '8p' sections/5_discussion/discussion.tex | grep -cF -- 'Overall, fine-tuned model results varied substanti'
1
report line 165, sections/5_discussion/discussion.tex:6
$ sed -n '6p' sections/5_discussion/discussion.tex | grep -cF -- 'Despite being long established as the gold standar'
1
report line 170, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'As for the comparison across performance metrics d'
1
report line 175, figures/cumulative_gain.tex:10
$ sed -n '10p' figures/cumulative_gain.tex | grep -cF -- 'Generally, lower MAE values indicate greater robus'
1
report line 183, sections/5_discussion/discussion.tex:8
$ sed -n '8p' sections/5_discussion/discussion.tex | grep -cF -- 'Our proposed pre-training approach improved model '
1
report line 191, sections/1_introduction/introduction.tex:11
$ sed -n '11p' sections/1_introduction/introduction.tex | grep -cF -- 'The CNN backbone is pre-trained using an extended '
1
report line 195, sections/3_methodology/b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'Additionally, we reimplement the patchify layer in'
1
report line 200, sections/appendix/b_additional_results/1_baseline.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'Overall differences between imaging modalities are'
1
report line 209, sections/3_methodology/b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- '\textbf{CNN Feature Extractor.}'
1
report line 210, sections/3_methodology/b_architecture.tex:7
$ sed -n '7p' sections/3_methodology/b_architecture.tex | grep -cF -- 'The CNN feature extractor takes the MR images as i'
1
report line 211, sections/3_methodology/b_architecture.tex:14
$ sed -n '14p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we concatenate the image embeddings obtained from '
1
report line 212, sections/3_methodology/d_pretraining.tex:3
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- '\textbf{CNN Feature Extractor.}'
1
report line 213, sections/3_methodology/d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we keep the parameters of the CNN feature extracto'
1
report line 214, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'During pre-training of the CNN feature extractor, '
1
report line 215, tables/results_pretrain_ablation.tex:27
$ sed -n '27p' tables/results_pretrain_ablation.tex | grep -cF -- 'pre-trains the CNN feature extractor using DINO'
1
report line 218, sections/3_methodology/c_variants.tex:1
$ sed -n '1p' sections/3_methodology/c_variants.tex | grep -cF -- 'The five model variations are:'
1
report line 219, sections/4_experiments/c_evaluation.tex:1
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'For the comparison across model variations, we als'
1
report line 220, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'stratified by imaging modality and model architect'
1
report line 221, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'HCCNet trained using diffusion weighted MR images '
1
report line 222, sections/4_experiments/d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- '\textbf{Comparison across Model Variations.}'
1
report line 223, sections/4_experiments/d_results.tex:15
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'stratified by image modality and model variation'
1
report line 224, sections/appendix/b_additional_results/1_baseline.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'stratified by image modality and model variation'
1
report line 225, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'stratified by imaging modality and model architect'
1
report line 228, sections/4_experiments/d_results.tex:15
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'That is, although baseline model results vary only'
1
report line 230, figures/cumulative_gain.tex:10
$ sed -n '10p' figures/cumulative_gain.tex | grep -cF -- 'across three MRI types'
1
report line 231, figures/calibration.tex:10
$ sed -n '10p' figures/calibration.tex | grep -cF -- 'across three MRI modalities'
1
report line 236, sections/4_experiments/d_results.tex:15
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'Finally, we evaluate the impact of our proposed pr'
1
report line 244, sections/abstract/abstract.tex:1
$ sed -n '1p' sections/abstract/abstract.tex | grep -cF -- 'To address this, we propose HCCNet, a novel model '
1
report line 249, sections/1_introduction/introduction.tex:1
$ sed -n '1p' sections/1_introduction/introduction.tex | grep -cF -- 'This is especially relevant in conditions like hep'
1
report line 254, sections/3_methodology/d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This teaches the model to identify the same patien'
1
report line 258, sections/3_methodology/d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This transfers the pre-trained representation to i'
1
report line 262, sections/appendix/a_implementation/3_hyperparams.tex:3
$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'This is due to convergence issues that we noted du'
1
report line 267, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'That is despite that baseline models trained using'
1
report line 275, sections/5_discussion/discussion.tex:6
$ sed -n '6p' sections/5_discussion/discussion.tex | grep -cF -- 'To support HCCNet'\''s capability to capture disease '
1
report line 279, sections/4_experiments/a_data.tex:1
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'In total, 963 MRI examinations were included in th'
1
report line 283, sections/5_discussion/discussion.tex:16
$ sed -n '16p' sections/5_discussion/discussion.tex | grep -cF -- 'Despite these successes, several challenges and li'
1
report line 291, sections/6_conclusion/conclusion.tex:1
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Additionally, exploring the integration of multi-m'
1
report line 301, sections/4_experiments/d_results.tex:3
$ sed -n '3p' sections/4_experiments/d_results.tex | grep -cF -- 'We report HCCNet'\''s fine-tuned performance (i) acro'
1
report line 305, sections/4_experiments/d_results.tex:11
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'Across imaging modalities, the models are thus rob'
1
report line 309, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'As aforementioned, we pre-train both the CNN backb'
1
report line 313, sections/3_methodology/d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Note that in our implementation, we use a 3D crop '
1
report line 317, sections/3_methodology/d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Note that during pre-training of the Transformer e'
1
report line 321, sections/appendix/a_implementation/3_hyperparams.tex:3
$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'Note that during CNN-backbone pre-training we slig'
1
report line 328, sections/4_experiments/d_results.tex:11
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'At least on the data evaluated in this study, vari'
1
report line 332, sections/4_experiments/c_evaluation.tex:8
$ sed -n '8p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Since all metrics are obtained through cross-valid'
1
report line 336, sections/3_methodology/d_pretraining.tex:3
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Accordingly, we define a student $F_s$ and a teach'
1
report line 343, sections/abstract/abstract.tex:3
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'The CNN backbone is pre-trained using a self-super'
1
report line 349, sections/1_introduction/introduction.tex:13
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'This application not only demonstrates HCCNet'\''s ca'
1
report line 356, sections/2_related_work/a_longitudinal_analysis.tex:3
$ sed -n '3p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'While the approach is relatively simple to impleme'
1
report line 362, sections/2_related_work/a_longitudinal_analysis.tex:5
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Hybrid models can be trained end-to-end, consecuti'
1
report line 369, sections/2_related_work/b_pretraining.tex:3
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'As such, they randomly derive different views from'
1
report line 375, sections/3_methodology/a_problem_formulation.tex:1
$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 'Since the frequency of liver screenings is typical'
1
report line 382, sections/3_methodology/d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Note that in our implementation, we use a 3D crop '
1
report line 388, sections/3_methodology/d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Specifically, we treat different series within a c'
1
report line 394, sections/3_methodology/d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Likewise, we concatenate the different series in t'
1
report line 400, sections/4_experiments/a_data.tex:1
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'Prior to pre-training and fine-tuning, MR images w'
1
report line 406, sections/4_experiments/a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'During fine-tuning we additionally exclude all pat'
1
report line 413, sections/4_experiments/a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'The folds are stratified by HCC outcome so that th'
1
report line 419, sections/4_experiments/a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'Because pre-training is re-run within every fold, '
1
report line 425, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'During the first 5\% of training steps (i.e., 1600'
1
report line 431, sections/4_experiments/b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'Concretely, we evaluate the full fusion of all thr'
1
report line 437, sections/4_experiments/c_evaluation.tex:1
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Every reported metric is computed on this per-fold'
1
report line 443, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'Contrast enhanced T1 weighted and the combination '
1
report line 449, sections/4_experiments/d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'As such, Figure \ref{fig:cumulative_gain} plots th'
1
report line 455, sections/4_experiments/d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'Extended reliability metrics are presented in Tabl'
1
report line 462, sections/4_experiments/d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'Figure \ref{fig:calibration} shows consistently lo'
1
report line 468, sections/4_experiments/d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'None of the fused configurations exceeds this best'
1
report line 474, sections/4_experiments/d_results.tex:29
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'The CNN-backbone dominance also holds for dynamic '
1
report line 480, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'An ablation that pre-trains only the CNN backbone '
1
report line 486, sections/5_discussion/discussion.tex:18
$ sed -n '18p' sections/5_discussion/discussion.tex | grep -cF -- 'Incorporating these data sources could further enh'
1
report line 492, sections/6_conclusion/conclusion.tex:1
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Exploratory experiments further showed that naivel'
1
report line 498, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'Contrarily, during pre-training of the Transformer'
1
report line 504, sections/appendix/a_implementation/3_hyperparams.tex:3
$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'This is due to convergence issues that we noted du'
1
report line 510, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'That is despite that baseline models trained using'
1
report line 516, figures/cumulative_gain.tex:10
$ sed -n '10p' figures/cumulative_gain.tex | grep -cF -- 'Optimal robustness is presented by the gray dashed'
1
report line 522, figures/calibration.tex:10
$ sed -n '10p' figures/calibration.tex | grep -cF -- 'The x-axis represents confidence levels (0.0 to 1.'
1
report line 528, tables/results_finetune.tex:42
$ sed -n '42p' tables/results_finetune.tex | grep -cF -- 'Second best results are underlined. DW-MRI compris'
1
report line 534, tables/results_base_vs_pre.tex:42
$ sed -n '42p' tables/results_base_vs_pre.tex | grep -cF -- 'Second best results are underlined. DW-MRI compris'
1
report line 540, tables/results_baseline.tex:42
$ sed -n '42p' tables/results_baseline.tex | grep -cF -- 'Second best results are underlined. DW-MRI compris'
1
report line 546, tables/results_fusion.tex:21
$ sed -n '21p' tables/results_fusion.tex | grep -cF -- 'The within-contrast augmentation restriction is re'
1
report line 552, tables/results_pretrain_ablation.tex:27
$ sed -n '27p' tables/results_pretrain_ablation.tex | grep -cF -- '``CNN backbone only'\'''\'' pre-trains the CNN feature e'
1
report line 558, tables/results_reliability.tex:32
$ sed -n '32p' tables/results_reliability.tex | grep -cF -- 'ECE represents the expected, while MCE denotes the'
1
report line 564, tables/results_reliability.tex:32
$ sed -n '32p' tables/results_reliability.tex | grep -cF -- 'Second best results are underlined. DW-MRI compris'
1
report line 573, sections/2_related_work/b_pretraining.tex:3
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Instead of simply comparing view pairs from differ'
1
report line 574, sections/2_related_work/b_pretraining.tex:5
$ sed -n '5p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'adopts a simple sequence-order-prediction task'
1
report line 575, sections/3_methodology/d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'this study employs a simple binary sequence-order-'
1
report line 576, sections/4_experiments/b_implementation.tex:3
$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we train the Transformer encoder using an abbrevia'
1
report line 577, sections/4_experiments/a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'robust performance estimates'
1
report line 582, sections/3_methodology/b_architecture.tex:3
$ sed -n '3p' sections/3_methodology/b_architecture.tex | grep -cF -- 'We use the CNN backbone'
1
report line 583, sections/3_methodology/b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we adapt the ConvNeXt architecture'
1
report line 584, sections/3_methodology/b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we replace the 2-dimensional depthwise convolution'
1
report line 585, sections/3_methodology/b_architecture.tex:21
$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we embed the input'\''s positional information'
1
report line 586, sections/3_methodology/b_architecture.tex:21
$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we replace the conventional sequence position'
1
report line 587, sections/3_methodology/b_architecture.tex:21
$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we compute the vector of intervals'
1
report line 588, sections/3_methodology/b_architecture.tex:26
$ sed -n '26p' sections/3_methodology/b_architecture.tex | grep -cF -- 'prepend'
1
report line 589, sections/3_methodology/b_architecture.tex:34
$ sed -n '34p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we add the positional encodings'
1
report line 590, sections/3_methodology/b_architecture.tex:39
$ sed -n '39p' sections/3_methodology/b_architecture.tex | grep -cF -- 'We feed the input sequence through the encoder $G$'
1
report line 591, sections/3_methodology/b_architecture.tex:44
$ sed -n '44p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we feed it through a pooling layer'
1
report line 592, sections/3_methodology/c_variants.tex:1
$ sed -n '1p' sections/3_methodology/c_variants.tex | grep -cF -- 'we introduce four variants of HCCNet'
1
report line 593, sections/3_methodology/c_variants.tex:10
$ sed -n '10p' sections/3_methodology/c_variants.tex | grep -cF -- 'we additionally introduce HCCNet-C (compact)'
1
report line 594, sections/3_methodology/d_pretraining.tex:1
$ sed -n '1p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we therefore design two (self-)supervised pre-trai'
1
report line 595, sections/3_methodology/d_pretraining.tex:3
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'this study extends the self-supervised DINO pre-tr'
1
report line 596, sections/3_methodology/d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'which are cropped from the original image and used'
1
report line 597, sections/3_methodology/d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we exploit the abundance of natural variation'
1
report line 598, sections/3_methodology/d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we randomly shuffle 50\% of the input sequences'
1
report line 599, sections/3_methodology/d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we actually randomly shuffle 66\% of sequences'
1
report line 600, sections/3_methodology/d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'We apply the sigmoid function to the output of the'
1
report line 601, sections/3_methodology/d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we reconcile the differing input dimensionality'
1
report line 602, sections/3_methodology/e_finetuning.tex:1
$ sed -n '1p' sections/3_methodology/e_finetuning.tex | grep -cF -- 'we initialize the parameters of HCCNet'
1
report line 603, sections/3_methodology/e_finetuning.tex:1
$ sed -n '1p' sections/3_methodology/e_finetuning.tex | grep -cF -- 'we append the final pooling layer as discussed in '
1
report line 604, sections/4_experiments/a_data.tex:1
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'This complete co-availability allows us'
1
report line 605, sections/4_experiments/a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'we include all available data'
1
report line 606, sections/4_experiments/a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'We partition the patient cohort'
1
report line 607, sections/4_experiments/a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'is repeated independently for each fold'
1
report line 608, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We train the CNN over 32000 training steps'
1
report line 609, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We employ the same cosine decay without warm-up fo'
1
report line 610, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we also limit the temperature of the teacher netwo'
1
report line 611, sections/4_experiments/b_implementation.tex:3
$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'While MRI scans are assumed to be i.i.d. during CN'
1
report line 612, sections/4_experiments/b_implementation.tex:3
$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'apply dropout with probability $p = 0.2$, and empl'
1
report line 613, sections/4_experiments/b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we update HCCNet'
1
report line 614, sections/4_experiments/b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We fine-tune the model over 400 training steps'
1
report line 615, sections/4_experiments/b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we select the batch size'
1
report line 616, sections/4_experiments/b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we then train HCCNet'
1
report line 617, sections/4_experiments/b_implementation.tex:7
$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we establish a baseline'
1
report line 618, sections/4_experiments/b_implementation.tex:7
$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we equally train the baseline'
1
report line 619, sections/4_experiments/b_implementation.tex:7
$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We employ the same optimizer'
1
report line 620, sections/4_experiments/b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we additionally evaluate a set of exploratory mult'
1
report line 621, sections/4_experiments/b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we naively concatenate the series'
1
report line 622, sections/4_experiments/b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we restrict the fusion experiments'
1
report line 623, sections/4_experiments/b_implementation.tex:11
$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we further disentangle'
1
report line 624, sections/4_experiments/b_implementation.tex:11
$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we evaluate two intermediate configurations'
1
report line 625, sections/4_experiments/b_implementation.tex:11
$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We conduct this ablation'
1
report line 626, sections/4_experiments/c_evaluation.tex:1
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we evaluate HCCNet'\''s baseline'
1
report line 627, sections/4_experiments/c_evaluation.tex:1
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we train ten independently seeded models (fifty mo'
1
report line 628, sections/4_experiments/c_evaluation.tex:6
$ sed -n '6p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we evaluate the models'\'' respective calibration'
1
report line 629, sections/4_experiments/c_evaluation.tex:8
$ sed -n '8p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we therefore refrain from drawing conclusions'
1
report line 630, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'is markedly stronger on AUROC'
1
report line 631, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'the combined modality nonetheless remains the weak'
1
report line 632, sections/4_experiments/d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'we explore the impact of varying model complexity'
1
report line 633, sections/4_experiments/d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'This robustness is tightest on AUROC'
1
report line 634, sections/4_experiments/d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'No model variant falls consistently below the diag'
1
report line 635, sections/4_experiments/d_results.tex:15
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'the magnitude of the improvement from our proposed'
1
report line 636, sections/4_experiments/d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'we compare the reliability'
1
report line 637, sections/4_experiments/d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'consistently show the lowest expected calibration '
1
report line 638, sections/4_experiments/d_results.tex:21
$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'This reduction is largest'
1
report line 639, sections/4_experiments/d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'we evaluate whether naively fusing'
1
report line 640, sections/4_experiments/d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'which reaches AUPRC = 0.588'
1
report line 641, sections/4_experiments/d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'As all differences fall within one standard deviat'
1
report line 642, sections/4_experiments/d_results.tex:29
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'pre-training only the CNN backbone recovers essent'
1
report line 643, sections/appendix/a_implementation/1_conv_layer.tex:3
$ sed -n '3p' sections/appendix/a_implementation/1_conv_layer.tex | grep -cF -- 'we inflate the 2D depthwise and pointwise convolut'
1
report line 644, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we randomly shift and scale the intensity'
1
report line 645, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we use the same data augmentation strategy'
1
report line 646, sections/appendix/b_additional_results/1_baseline.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'consistently display the highest detection rate'
1
report line 647, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'consistently display the lowest average reliabilit'
1
report line 648, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'HCCNet fine-tuned using diffusion weighted MRIs di'
1
report line 653, sections/6_conclusion/ack.tex:2
$ sed -n '2p' sections/6_conclusion/ack.tex | grep -cF -- 'op basis van MRI-radiomics'
1
report line 657, sections/6_conclusion/ack.tex:6
$ sed -n '6p' sections/6_conclusion/ack.tex | grep -cF -- '(OpenAI ChatGPT) to help'
1
report line 661, sections/6_conclusion/ack.tex:7
$ sed -n '7p' sections/6_conclusion/ack.tex | grep -cF -- 'reviewed and edited the'
1
```

### Grant report

```
report line 6, paragraph 25
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^25: ' | grep -cF -- 'Open-access charges and costs of the openly releas'
1
report line 10, paragraph 31
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'to build the interpretable background-liver compon'
1
report line 14, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'The tested study is the latest usable study at lea'
1
report line 18, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'is the exploratory question of C3.'
1
report line 22, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'with the readout'\''s sensitivity fixed in advance'
1
report line 26, paragraph 41
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The livers of all patients are then aligned to one'
1
report line 34, paragraph 34
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'across serial scans before diagnosis'
1
report line 35, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'the scan-to-scan variation of cirrhotic tissue'
1
report line 36, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'into real liver scans'
1
report line 37, paragraph 41
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'overlaps across scans [12]'
1
report line 38, paragraph 41
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'at every scan date'
1
report line 39, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'the ordinary scan-to-scan variation of stable live'
1
report line 40, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'same scan year'
1
report line 41, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'decompensation status at each scan'
1
report line 42, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'this scan-to-scan variation'
1
report line 43, paragraph 46
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^46: ' | grep -cF -- 'aligns the scans'
1
report line 44, paragraph 47
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^47: ' | grep -cF -- 'decompensation status at each scan'
1
report line 45, paragraph 47
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^47: ' | grep -cF -- 'a scan-year covariate'
1
report line 48, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'with the readout'\''s sensitivity fixed in advance'
1
report line 49, paragraph 45
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^45: ' | grep -cF -- 'the smallest detectable change'
1
report line 54, paragraph 40
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The cohort holds 243 patients with outcome labels '
1
report line 61, paragraph 48
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'If the hypothesis holds, surveillance can warn wit'
1
report line 68, paragraph 8
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^8: ' | grep -cF -- 'Liver cancer usually grows in a scarred, cirrhotic'
1
report line 72, paragraph 11
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^11: ' | grep -cF -- 'Leverkanker ontstaat meestal in een verlittekende,'
1
report line 76, paragraph 34
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Hepatocellular carcinoma (HCC) mostly arises in a '
1
report line 80, paragraph 34
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'In practice, surveillance detects a tumour only on'
1
report line 84, paragraph 34
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises the tumour ['
1
report line 91, paragraph 40
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The analysis uses the sequences taken without cont'
1
report line 98, paragraph 40
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Studies are a median 7.9 months apart in patients '
1
report line 105, paragraph 34
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Molecular studies have shown that prognostic signa'
1
report line 109, paragraph 48
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'predict HCC development in cirrhosis [8]'
1
report line 116, paragraph 31
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'of the applicant'\''s own postdoctoral salary'
1
report line 120, paragraph 31
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'The applicant'\''s standing appointment covers the re'
1
report line 124, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'a surveillance cohort the applicant already holds'
1
report line 128, paragraph 46
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^46: ' | grep -cF -- 'The applicant works at 0,42 FTE'
1
report line 135, paragraph 8
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^8: ' | grep -cF -- 'Where in the liver the change concentrates is expl'
1
report line 139, paragraph 31
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'Computing is provided by the host institution at n'
1
report line 143, paragraph 31
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'No basic amenities, overheads, or maintenance are '
1
report line 147, paragraph 49
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^49: ' | grep -cF -- 'The atlas (component definitions, summary maps and'
1
report line 164, paragraph 40
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Of the 925 studies, 776 are usable (all non-contra'
1
report line 170, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A radiologist blinded to outcome re-reads the test'
1
report line 174, paragraph 48
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'Molecular pathology places prognostic signal in th'
1
report line 183, paragraph 8
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^8: ' | grep -cF -- 'Cancer is thought to arise from gradual change acr'
1
report line 190, paragraph 11
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^11: ' | grep -cF -- 'Kanker ontstaat vermoedelijk uit een geleidelijke '
1
report line 197, paragraph 31
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'The applicant'\''s standing appointment covers the re'
1
report line 204, paragraph 31
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'Dissemination covers open-access publication charg'
1
report line 211, paragraph 34
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'In practice, surveillance detects a tumour only on'
1
report line 218, paragraph 34
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises the tumour ['
1
report line 225, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'The tested study is the latest usable study at lea'
1
report line 232, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'A within-patient analysis adjusted for decompensat'
1
report line 239, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'Molecular confirmation lies outside this project. '
1
report line 246, paragraph 35
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'If it does, surveillance can warn within the curat'
1
report line 253, paragraph 40
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The clinical record gives the date of HCC diagnosi'
1
report line 260, paragraph 40
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Of the 925 studies, 776 are usable (all non-contra'
1
report line 267, paragraph 41
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The analyst receives only studies taken before dia'
1
report line 274, paragraph 41
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Components are checked against estimates of liver '
1
report line 281, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'Tested studies at level 2 are excluded (none of th'
1
report line 288, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'With 8 patients against 148 never-HCC patients, th'
1
report line 295, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A supporting model gives each patient their own ba'
1
report line 302, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'The analysis code, number of components and matchi'
1
report line 309, paragraph 48
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'What is new here is the within-patient, point-by-p'
1
report line 319, paragraph 46
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^46: ' | grep -cF -- 'Overlapping work packages: WP1 (mo 1-4) aligns the'
1
report line 328, paragraph 47
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^47: ' | grep -cF -- 'Risks and mitigation. (i) Signal too small above c'
1
report line 340, paragraph 41
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Success means reproducible components that track t'
1
report line 344, paragraph 42
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'Success means a one-sided test at alpha 0.05 showi'
1
report line 348, paragraph 43
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^43: ' | grep -cF -- 'Success means the future tumour segment ranks abov'
1
report line 355, paragraph 64
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^64: ' | grep -cF -- 'Application Form '
1
```

## Files

`wc -l`, run after the last edit of the record:

```
     389 .scratch/3-the-writing-base/agents/reviews/6-marks.md
     122 .scratch/3-the-writing-base/agents/reviews/6-run/grant-marks-1.md
     117 .scratch/3-the-writing-base/agents/reviews/6-run/grant-marks-2.md
     357 .scratch/3-the-writing-base/agents/reviews/6-run/grant-report.md
     100 .scratch/3-the-writing-base/agents/reviews/6-run/manuscript-marks-1-reasons.md
     181 .scratch/3-the-writing-base/agents/reviews/6-run/manuscript-marks-1.md
     140 .scratch/3-the-writing-base/agents/reviews/6-run/manuscript-marks-2-reasons.md
     249 .scratch/3-the-writing-base/agents/reviews/6-run/manuscript-marks-2.md
     663 .scratch/3-the-writing-base/agents/reviews/6-run/manuscript-report.md
     981 .scratch/3-the-writing-base/agents/reviews/6-report.md
    3299 total
```

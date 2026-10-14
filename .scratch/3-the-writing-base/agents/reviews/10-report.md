NOT DONE: the step's check does not hold. Of the manuscript run's 133 rows, 97 are not marked right by both markers. Of the grant run's 90 rows, 52 are not. Gate conditions 2, 5 and 6 fail on the runs. Conditions 1, 3, 4 and 7 hold. The manuscript report says itself that it does not cover the whole draft: its "Tense per section" and "Voice" group leaves out six files. Two parts of the brief were not done as written. The cases' first run was not made before the runs. The session wrote helper scripts and scratch files under the scratchpad that the brief does not name, and the user approved none of the scripts. Each failure is listed under its condition below and in `10-marks.md`. By ruling J, entry 3 is not marked done, and the failure goes to the user for a ruling.

# Report of step 10 of plan 3, the fifth runs of /writing

## Open items of the state file

none

## The cases' first run

Entry numbers are 1-based line numbers of the session's transcript, `~/.claude-backup/projects/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda.jsonl`.

The brief's first run was not made before the runs, as "Wrong or impossible in the brief" says. The unchanged tree is read from the base commit instead. `git ls-tree -r --name-only 9f6a598 -- .scratch/3-the-writing-base/agents/reviews/10-run .scratch/3-the-writing-base/agents/reviews/10-marks.md` prints nothing (`ls-tree exit 0`). The session's transcript shows `10-run/` first made by `mkdir -p` at entry 43602, after both runs. So none of the record existed for any of the twelve cases. After the step:

- C1: met. The manuscript report's 147 place checks under "Place checks" all print `1`. Every place is `file:line` with its path from the main file's folder. That holds for the further places and list entries too. 129 of the 130 numbered findings stand in included files, such as `sections/abstract/abstract.tex:3`.
- C2: met. The grant report's 124 place checks all print `1`. The header place is `paragraph 64 [word/header1.xml]`.
- C3: not met. Every group is named by page and section and has one line. Five manuscript lines and two grant lines are named by a marker as not meeting "How you group them". Two manuscript groups are named as out of order: group 7 by manuscript marker 1, and group 12 by both manuscript markers. Condition 2 lists each.
- C4: not met. Finding 80 of the manuscript report gives "see entry 89, which gives this sentence whole" in place of a replacement. Grant findings 3a and 3d hold brackets that point at definitions elsewhere in the draft ("as the Approach paragraph gives it", "as C2 gives it", "as C1 gives it"). Grant 12e Breaks 1 and 2 carry 3a's text. Both grant markers name each as a reference. Every other finding quotes its passage and gives text or "delete".
- C5: met for both runs, with the evidence under condition 3.
- C6: met for both runs, with the evidence under condition 3.
- C7: met for both runs, with the evidence under condition 4.
- C8: partial. Every row has two marks from four fresh agents. Each was served `claude-opus-5-5` as `ordo-high`, given the report by path, and read what the case lists. The missing part is ten marks with no reason of their own, which condition 6 lists. Each of those markers had spent its one resume, so the marks stay as they are.
- C9: met as a record. `10-marks.md` has one row per finding, further place, split and list entry. It lists the 97 and 52 rows not marked right by both, each with both reasons. The step's check therefore does not hold.
- C10: met. Four marker starts, all four used. No marker prompt holds a line of either report, and the four resume messages hold none.
- C11: met. Each of the four prompts carries both quoted blocks word for word. The manuscript markers ran no command. The grant markers ran only the script's command on the copy and that command piped to `grep -E '^<n>: '`.
- C12: not met. Two passages are given twice, as condition 5 lists. Most rows marked wrong carry a replacement that leaves a further break unnamed, as the rows of `10-marks.md` show.

## DONE / NOT DONE

| Check | Result |
|---|---|
| Copies equal their sources before the runs | DONE: entry 43412 printed `diff exit 0`, `cmp exit 0`, `rh status exit 0` and `v7.1.0-rc.5` |
| Cases' first run before the runs | NOT DONE: read from the base commit afterwards, as "The cases' first run" says |
| Manuscript run through the Skill tool | DONE: review agent a9088c50255802da8, `ordo-high`, served `claude-opus-5-5`, 156082 tokens, 38 tool uses, 24.4 min |
| Grant run through the Skill tool | DONE: review agent af8c488aa7ca0db17, `ordo-high`, served `claude-opus-5-5`, 147413 tokens, 6 tool uses, 28.9 min |
| Reports saved into `10-run/` | DONE: `extract_handback.py` printed 75974 and 67972 characters. Its second run into the scratchpad, compared with `cmp`, exited 0 for both. One letter of the manuscript report is written by its name (`<latin small letter e with acute>`), and two characters of the grant report (`<en dash>`) |
| Four markers | DONE: manuscript a9285b209948a9895 (265399 tokens, 40 tool uses, 17.8 min; 267814 tokens in total with its resume, 3 tool uses and 0.2 min on the resume) and aafb8073cdd7eafde (247629 tokens, 40 tool uses, 15.4 min; 256231 tokens in total with its resume, 1 tool use and 1.2 min on the resume); grant ad54cb074e204e730 (185690 tokens, 7 tool uses, 13.5 min; 197620 tokens, 13 tool uses, 15.1 min in total with its resume) and ad1c69010730ed017 (188613 tokens, 7 tool uses, 14.0 min; 191841 tokens, 10 tool uses, 14.6 min in total with its resume). Each is `ordo-high`, served `claude-opus-5-5` |
| Every row right by both | NOT DONE: 97 manuscript rows and 52 grant rows are not |
| Gate conditions 1 to 7 | NOT DONE: 2, 5 and 6 fail |
| Files outside the ledger only as the brief names | NOT DONE: the scratch files under "Helper scripts and scratch files" |
| Verify 1, the character-set check over `10-marks.md`, `10-report.md` and `10-run/*` | DONE: it prints nothing, exit 0 (quoted under "Files") |
| Verify 2, the copies equal their sources after the marks | DONE: `diff exit 0`, `cmp exit 0` |
| Verify 3, research-hub status of the two source folders | DONE: `rh status exit 0` with no line printed, before and after |
| Verify 4, `git status --short` in `.agents/worktrees/3-the-writing-base-10` | DONE: it prints nothing (`wt status exit 0`). `git -C .agents/worktrees/3-the-writing-base-10 log --oneline -1` prints 9f6a598 |

## The gate conditions

1. **Each finding at its place.** Holds.
   - The 271 place checks under "Place checks" all print `1`: 147 for the manuscript and 124 for the grant.
   - Every place of the manuscript report gives its path from the main file's folder. 129 of its 130 numbered findings stand in included files. Finding 60 stands at `main.tex:45`.
   - A split gets a check on the first and the last sentence it quotes.
   - Three manuscript passages are shorter than four words and are checked whole: "across model architectures" (68) and "\textbf{CNN Feature Extractor.}" (76 and 79).
   - The further splits of 120 and 126 quote only the sentence after the break. Each is checked on that sentence. The missing sentence before the break is a failure of the split form, listed under condition 5.
2. **Grouped by rule, each group line naming the reader's loss.** Fails. The manuscript report has 15 groups and the grant report 14. Each heading is followed by one line. Each report opens with the groups that change what the reader believes. Each line, group by group, with the session's reading of it and the markers' findings:
   - Manuscript:
     1. "Hedging": names a loss. The claims of the abstract and the Discussion are taken as proven for clinical use and for other diseases, at `abstract.tex:5`.
     2. "Limitations and alternative interpretations": names a loss. The calibration gain is read as holding for every model, at `d_results.tex:21`.
     3. "Evidence for claims": names a loss. The background's claims cannot be checked.
     4. "Vague language": names a loss. The reader cannot tell which studies the claims about prior work refer to.
     5. Section A, vague qualifiers: both markers fail it. The line adds that "the '4x' variant has 3.3 times the base model's parameters". That is a number the draft's data contradict, a content point and no loss a vague qualifier causes.
     6. registers, "What the reader looks for": names a loss. The methods name no reporting guideline to check them against.
     7. "Most specific term": names a loss, the 147.1% read as a general gain. Manuscript marker 1 names its place as out of order. A wrong belief about the headline result stands below groups 3 to 6, whose losses are "cannot check" or "cannot tell".
     8. "Terms defined at first use": names a loss. Both markers name its sentence "'SSL' is never explained" as a loss that finding 52 of group 5 shows, not a finding of group 8. Marker 1 fails it in part and marker 2 fails it.
     9. Section D, "No synonym cycling": names a loss. The reader cannot tell whether four names cover the same five configurations.
     10. "Tense per section" with registers, "Voice": says no claim changes and names a cost. It also says the group lists three files only. Manuscript marker 2 reads the line as meeting the rule and names the gap in coverage. Manuscript marker 1 names the same gap under the report's coverage.
     11. "Transitions": says no claim changes and names a cost.
     12. "Clear antecedents": both markers fail it. "A reader has to guess what 'this' refers to" restates the rule. Manuscript marker 1 says the loss does not hold at its example, `discussion.tex:12`. Both markers name its place as out of order. It stands after groups 10 and 11, whose lines say no claim changes, and its own line does not say so.
     13. Section C: manuscript marker 2 fails it. The line describes the break and names no cost.
     14. Section D, paragraphs: both markers fail it. The line describes the breaks ("paragraphs of five to nine sentences"). Its own example, `a_data.tex:3`, has ten sentences.
     15. Section F: names a cost. Each line break shows up as a change of its own in a diff.
   - Grant:
     1. "Hedging": names a loss. An 8-patient result is read as showing that surveillance can warn within the curative window (paragraph 35).
     2. Section A, vague qualifiers: names a loss. The size of the problem is not stated (paragraph 34).
     3. "Terms defined at first use": names a loss. The endpoint's definition cannot be followed (paragraph 35).
     4. Section D, "No synonym cycling": names a loss. "The liver test" can be taken for a clinical liver test (paragraph 41).
     5. "Evidence for claims": names a loss. The clinical reason for the choice of sequences cannot be checked (paragraph 40).
     6. "Clear antecedents": names a loss. Grant marker 1 notes that "which of four mitigations" should be three, since "it" can stand only for the three items before it. It reads the loss as holding.
     7. registers, "Voice": names a loss. "The applicant" and "we" can be taken for two parties (paragraph 46).
     8. Section 0, "No repeated construction": says no claim changes and names a cost.
     9. Section E, "Sentence length": says no claim changes and names a cost.
     10. "Formality": both markers fail it. The line says the reader "gets two separate pieces of prior work ... in one sentence". That describes the break and names no cost.
     11. Section D, lists in paragraph form: says no claim changes and names a cost.
     12. Section D, paragraphs: says no claim changes and names a cost.
     13. "Tense per section": both markers fail it. The line describes the break and restates the rule ("The row for reporting findings asks for the past tense").
     14. Section B and section 0: says no claim changes and names a cost, a character a plain-text viewer or a diff may not show.

   The failures under this condition:
   - Group lines: manuscript 5, 8, 12, 13 and 14, and grant 10 and 13. Manuscript marker 1 named manuscript 5, 8 (in part), 12 and 14. Manuscript marker 2 named 5, 8, 12, 13 and 14. Both grant markers named grant 10 and 13.
   - Order: manuscript group 7 (manuscript marker 1) and manuscript group 12 (both manuscript markers).
   - Both grant markers read the grant groups as most consequential first. Groups 1 to 7 change a claim, and groups 8 to 14 say they change none.
3. **One fresh agent per run, editing no file.** Holds.
   - Manuscript: agent a9088c50255802da8. Its `agent-a9088c50255802da8.meta.json` reads `"agentType":"ordo-high"`, and all 46 of its model lines read `claude-opus-5-5`.
     - Its `tool_use` names: `Read` 36, `Bash` 1, `SubagentHandback` 1. No `Edit`, `Write` or `NotebookEdit`.
     - The 36 `Read` calls are the prose standard, `rules.md`, `registers.md` and the 33 draft files: 36 distinct files, none with an `offset` or `limit`.
     - Its one `Bash` command runs the grep once for each draft file in one call, with nothing redirected:
       `D=<scratchpad>/3-2-run/manuscript; for f in main.tex sections/abstract/abstract.tex sections/1_introduction/introduction.tex sections/2_related_work/a_longitudinal_analysis.tex sections/2_related_work/b_pretraining.tex sections/3_methodology/a_problem_formulation.tex sections/3_methodology/b_architecture.tex figures/architecture.tex sections/3_methodology/c_variants.tex sections/3_methodology/d_pretraining.tex sections/3_methodology/e_finetuning.tex sections/4_experiments/a_data.tex sections/4_experiments/b_implementation.tex sections/4_experiments/c_evaluation.tex sections/4_experiments/d_results.tex tables/results_finetune.tex figures/cumulative_gain.tex tables/results_base_vs_pre.tex figures/calibration.tex tables/results_fusion.tex tables/results_pretrain_ablation.tex sections/5_discussion/discussion.tex sections/6_conclusion/conclusion.tex sections/6_conclusion/ack.tex sections/appendix/a_implementation/1_conv_layer.tex figures/conv_block.tex sections/appendix/a_implementation/2_augmentations.tex sections/appendix/a_implementation/3_hyperparams.tex tables/hyperparams.tex sections/appendix/b_additional_results/1_baseline.tex tables/results_baseline.tex sections/appendix/b_additional_results/2_reliability.tex tables/results_reliability.tex; do echo "== $f"; LC_ALL=C grep -n '[^ -~]' "$D/$f"; done`
   - Grant: agent af8c488aa7ca0db17, `ordo-high`. All 9 of its model lines read `claude-opus-5-5`.
     - Its `tool_use` names: `Read` 3, `Bash` 2, `SubagentHandback` 1. The three pages are each read with no `offset` or `limit`.
     - Its two commands, quoted whole with `<copy>` for the grant copy's path:
       - `python3 '/Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py' '<copy>'`
       - `python3 '/Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py' '<copy>' | LC_ALL=C grep -n '[^ -~]'`
     - The skill path is the link that resolves into the pinned worktree. The command is the one `SKILL.md`, "What it reads" 4, gives, which has no `-I`.
   - One `Agent` call in the session's transcript per run. Entry 43437 stands between the manuscript `Skill` call (43415) and the grant `Skill` call (43462). Entry 43477 stands between the grant `Skill` call and its report (43566).
4. **The session wrote no file and read no draft in each run's span.** Holds.
   - The manuscript span runs from its `Skill` call (43415) to its report (43508). The grant span runs from its `Skill` call (43462) to its report (43566). The calls from 43462 to 43508 stand in both spans and are listed once.
   - The `tool_use` calls from 43415 to 43566, in order:
     - `Skill` (writing, manuscript), at 43415.
     - `Bash` (43427): `grep -n '^reviewer\|^standards\|^reviewer_effort' .agents/plan.yaml; ls skills/repo-setup/templates/docs/dev/prose-standard.md`, then the Steps 3 `grep -n -e '\\input{' -e '\\include{' 'main.tex'`.
     - `Bash` (43430): the same `grep` over the 21 files `main.tex` inputs, each line prefixed with its file by `sed`.
     - `Bash` (43433): the same `grep` over the 11 nested files, then `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "effort exit $?"`.
     - `Agent` (43437).
     - `Bash` (43446 and 43450): `grep -o '"model":"[^"]*"' $T | sort | uniq -c` on the agent's transcript, the first with `cat ${T%.jsonl}.meta.json`.
     - `Skill` (writing, grant), at 43462. The calls from here to the `Read` at 43499 stand in both spans. The `Read` at 43551 stands in the grant span only.
     - `Bash` (43474): the configuration `grep`, `ls -l` of the copy, and `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "effort exit $?"`.
     - `Agent` (43477).
     - `Bash` (43485): the model read and `cat` of the agent's `meta.json`.
     - Two `Read` calls (43489 and 43499) of the runner's saved copy of the manuscript agent's hand-back under `tool-results/`, which is not a draft file.
     - One `Read` call (43551) of the runner's saved copy of the grant agent's hand-back.
   - In both spans there was no `Write`, `Edit` or `NotebookEdit`, no command that writes, no `sleep` and no read of a draft file.
   - The turn shape is the brief's.
     - The manuscript agent's notice (43457, with its hand-back at 43459) started the turn in which the grant `Skill` call (43462) stands. That turn ended with the manuscript report (43508).
     - The grant agent's notice (43517, with its hand-back at 43519) started the turn that ended with the grant report (43566). The context was compacted inside that turn (43525).
     - The text that ends the manuscript turn equals the manuscript agent's `SubagentHandback` message, 75974 characters, compared with `==` in `python3 -I` (`True`). The text that ends the grant turn equals the grant agent's, 67972 characters (`True`).
     - The one turn that ended inside the manuscript span (43453) ended before the agent's notice.
   - The pin: `describe` printed `v7.1.0-rc.5`. Both `Skill` results name `Base directory for this skill: /Users/axelfaes/.claude-backup/skills/writing`, which resolves into the pinned worktree at 509e516.
5. **Every finding quotes its passage and gives a replacement as text.** Fails.
   - Manuscript finding 80 reads `Replacement: see entry 89, which gives this sentence whole.`, a reference to another finding. Both manuscript markers name it.
   - Two places are given twice, against `SKILL.md`, "A finding": "No later group gives it again or refers to it." Both manuscript markers name each.
     - `d_results.tex:5`, "across model architectures": in 68, and again inside 100's passage, in a later group.
     - `d_pretraining.tex:10`, "we keep the parameters of the CNN feature extractor fixed": in 80, and again in 89.
   - The further splits of 120 and 126 quote only the sentence after the break. `SKILL.md` asks a split to quote the last sentence before it and the first after it. Both manuscript markers mark both rows wrong by condition 1.
   - Grant findings 3a and 3d, and 12e Breaks 1 and 2, give brackets that point at definitions elsewhere in the draft. The brackets read "as the Approach paragraph gives it", "as C2 gives it" and "as C1 gives it". Both grant markers name each as a reference in place of text.
   - Manuscript finding 105 ends with a line on section E. The line says the sentence has 36 words and the replacement 33, "which the comparison of three numbers needs". Manuscript marker 1 reads it as the last pass's line that the finding still breaks section E. Manuscript marker 2 reads it as a concession not written as such a line. The session reads it as a still-breaks line, since it names a rule the replacement still breaks.
   - Manuscript findings 116, 120 and 125 carry notes "(... as in entry N)", and each also writes its text out whole. Manuscript marker 2 names them and does not count them as references.
   - No grant passage or place is given twice. Both grant markers read the repeated sentences of group 12 as the split form `SKILL.md` requires, and the session reads them the same way.
6. **Two marks per row from four distinct fresh agents.** Fails on one point: ten marks have no reason of their own, listed at the end of this condition. The rest holds.
   - The four markers are distinct from each other and from both review agents.
   - Each is `ordo-high` (its `meta.json`) and served `claude-opus-5-5` only. The model lines read `claude-opus-5-5` 48, 43, 16 and 13 times, resumes included, and name no other model.
   - Each `Agent` prompt (entries 43635 to 43638, of 11073, 11073, 5713 and 5713 characters) has `subagent_type` `ordo-high` and model `opus`. Each names its saved report's absolute path. Each holds no line of either report, checked in `python3 -I` against every report line of 20 or more characters: 0 in each.
   - Each prompt holds two quoted blocks word for word: the rule on commands (brief lines 77 to 83) and the rule on reasons (brief lines 102 to 106). Compared line by line in `python3 -I`, both blocks give `True` in all four.
   - The four resume messages (entries 43678, 43706, 44299 and 44460, of 1155, 879, 835 and 1649 characters) hold no line of either report. They name the saved report's path and the rows by number, letter or break, and nothing of the other marker's marks.
   - The saved reports equal the review agents' final messages (`cmp` above).
   - Manuscript marker 1: `Read` 41, `SubagentHandback` 2, no command. Manuscript marker 2: `Read` 39, `SubagentHandback` 2, no command.
     - Each read 38 distinct files: the report, the prose standard, `SKILL.md`, `rules.md`, `registers.md` and the 33 draft files. Each draft file took one read with no `offset` or `limit`.
     - Each read the report in two `Read` calls. The first returned lines 1 to 486. The second (`offset` 486, and for marker 2 `limit` 140) returned the rest of the 622 lines.
     - On its resume, manuscript marker 1 read the report's lines 349 to 373 and `sections/appendix/b_additional_results/1_baseline.tex` whole. Manuscript marker 2 made no call on its resume but its hand-back.
   - Grant marker 1: `Read` 5, `Bash` 6, `SubagentHandback` 2. It read the report and the four pages with no `offset` or `limit`. Its commands, quoted whole with `<copy>` for the grant copy's path:
     - `python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<copy>'`
     - on its resume, five commands:
       - `python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<copy>' | grep -E '^31: '`
       - `python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<copy>' | grep -E '^40: '`
       - `python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<copy>' | grep -E '^41: '`
       - `python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<copy>' | grep -E '^42: '`
       - `python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<copy>' | grep -E '^48: '`
   - Grant marker 2: `Read` 6, `Bash` 2, `SubagentHandback` 2. It read the report and the four pages with no `offset` or `limit`, and on its resume the report's lines 621 to 637 again. Its commands:
     - `python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<copy>'`
     - on its resume, `python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<copy>' | grep -E '^48: '`
   - No marker ran a `grep` on a draft file, a folder, a glob, the saved report or a page. None printed a draft file apart from the grant markers' script command and the pipe the rule allows. No marker wrote, started an agent or invoked a skill. No marker was given the other's marks.
   - The resumes:
     - Grant marker 1 was resumed once for 11 rows of group 12. Their reasons said which finding's text the replacement writes, but not whether it ends the paragraph break. The rows:
       - 12c Break 1 and 12f Break 3;
       - 12g Breaks 2, 3 and 7;
       - 12h Breaks 3, 5, 6 and 7;
       - 12i Breaks 2 and 3.
     - Grant marker 2 was resumed once for 12i Break 3, for the same cause.
     - Manuscript marker 1 was resumed once, in repair round 1, for row 73, whose reason read "with the same replacement and reason as 72".
     - Manuscript marker 2 was resumed once, at landing, for 14 rows whose reasons named only the rule and the new words, such as "is past passive" or "ends the cycling". The rows are 66, 68, 69, 74, 75, 77, 78, 79, 81, 82, 95, 97, 99 and 106.
     - Each gave a reason of its own for every row named, and no mark changed.
   - Ten marks have no reason of their own after the resumes. Each marker's one resume is spent, so they stay as they are. They are the failure of the condition.
     - Grant marker 2, row 12b: "The split mirrors 12a, and the second sentence reads as 9p gives it." It says which row the text follows, not whether the parts the split leaves meet section D.
     - Manuscript marker 1, rows 93, 94, 97, 99, 101, 103, 104 and 106. Each reason says the passage stands and names the tense and the new verb, such as "\"HCCNet was updated\" is passive past." (97). The rule on reasons gives "a tense and its new verb" as its example of no reason of its own. Manuscript marker 1 had spent its one resume on row 73 in repair round 1.
     - Grant marker 1, row 7b: "The passage stands, and \"Our standing appointment\" is the \"we\" form the page asks for." It names the rule and the new words only.
   - Every other row of both runs has a reason of its own that says whether the passage stands at its place and whether the replacement ends the break. The session read the right marks of all four markers row by row for this, in the marks and resume files.
7. **The copies equal their sources after the marks.** Holds: `diff exit 0`, `cmp exit 0`, `rh status exit 0`.
8. **Row counts beside step 8's.** The manuscript run has 133 rows against step 8's 228. The grant run has 90 against 74. This is a fact for the user and gates nothing.
9. **What the marks do not check.** The marks judge the findings the reports give, and no check counts breaks a report missed, since the gate asks for none.
   - The manuscript report's own coverage note names six files whose procedure sentences it did not list under "Tense per section" and "Voice":
     - `sections/3_methodology/b_architecture.tex`
     - `sections/3_methodology/e_finetuning.tex`
     - `sections/4_experiments/a_data.tex`
     - `sections/4_experiments/c_evaluation.tex`
     - `sections/appendix/a_implementation/2_augmentations.tex`
     - `sections/appendix/a_implementation/3_hyperparams.tex`
   - Both manuscript markers name this as a report that does not cover the whole draft.
   - Grant marker 1 names the first use of "atlas", at paragraph 25, as reported nowhere.

## The rows not marked right by both

The 97 manuscript rows and 52 grant rows, each with both reasons, are listed in `10-marks.md` under "Rows not marked right by both". Both markers mark 88 of the manuscript rows wrong and 29 of the grant rows.

The conditions the wrong marks name:

| Marker | Condition 4 | Condition 2 | Condition 1 |
|---|---|---|---|
| Manuscript marker 1 | 90 | 10 | 2 |
| Manuscript marker 2 | 93 | 10 | 2 |
| Grant marker 1 | 20 | 12 | 0 |
| Grant marker 2 | 39 | 14 | 0 |

Grant marker 1's count of condition 2 is of the first condition each mark names. It names condition 2 also inside the reasons of 2c, 3a and 6a, which makes 15.

The rows fall into these kinds.

- A replacement that ends the named break and leaves another break of the four pages, or changes the claim:
  - A vague word kept or swapped for another: "most" for "dominant" (manuscript 12 and 13), and "consistently" turned into "in every fold" (102).
  - A tense or voice change the finding does not name: manuscript 27, 45, 48, 70, 71, 122 split 2 and 124. In the grant, 9f and the group 12 breaks that carry it.
  - A computed number or a relation outside square brackets: manuscript 44, 47 and 48.
  - A sentence over the length rule left in the replacement: manuscript 7 and 105, and grant 9k.
  - A word, a clause or a condition dropped: manuscript 5, 7, 42, 91 and 100, and grant 9d and 9i.
  - A scope word changed, such as "the" to "a" or "each": grant 8c and 9b, and 12f Breaks 1 and 2, which carry 9b.
- A further break of the passage the finding does not name: grant 2c, whose passage holds a 24-word sentence and whose finding names no sentence-length break.
- A rule whose words do not describe the passage, condition 2:
  - The grant's Voice findings on procedure steps: 2g, 2h, 3g, 7d to 7i, and the Voice lines of 3a, 3h and 6a. The Medicine and Health register keeps a procedure in the passive.
  - The en dash of grant 14a, which separates the fields of a title and is no aside.
  - In the manuscript, a method rule read as a hedge (14) and a cross-reference read as an announcement (114).
- A first use that is not the first: grant 3d, since "atlas" first stands at paragraph 25.
- A reference in place of text: manuscript 80, and grant 3a, 3d and 12e Breaks 1 and 2.
- A split form or count that does not hold:
  - The further splits of 120 and 126 (condition 1).
  - A split part that keeps five or more sentences once added sentences are counted: manuscript 118 and 126.
  - A paragraph's sentence count stated wrong: manuscript 118 and 122.
- Rows one marker marks right and the other wrong:
  - Manuscript, marker 2 wrong: 4, 26, 64, 72, 73, 93 and 113.
  - Manuscript, marker 1 wrong: 16 and 89.
  - Grant, marker 2 wrong: 2a, 2b, 2d, 3h, 4a, 7c, 8a and 8b, beside the group 12 breaks of the next item.
  - Grant, marker 1 wrong: 3c and 9i.
- Group 12 breaks of the grant that grant marker 2 alone marks wrong. Each carries a replacement of an earlier finding that marker 2 marks wrong. The breaks:
  - 12c Break 1;
  - 12d Breaks 1 to 3;
  - 12g Breaks 1 to 3, 6 and 7;
  - 12h Breaks 3 to 5 and 8.

## Judgment calls the brief left open

- The manuscript review agent ran its one grep once for each draft file inside one `for` loop in one `Bash` call. The session reads this as the one grep run once for each file. `SKILL.md` names the command and the count of runs, not the count of calls.
- A split gets two place checks, on the first and the last sentence it quotes. A sentence fragment of under four words left by the sentence split is joined to the next sentence. Every other place gets one check.
- Reasons of their own:
  - A reason that says only which other row or finding the text follows is no reason of its own.
  - A reason that says the passage stands and names only the rule and the new words is no reason of its own, as the rule on reasons says. "is passive past" and "ends the cycling" are such reasons.
  - A reason that adds a fact of its own row is a reason of its own, such as which set a new name covers in the draft, that every value is kept, or the numbers that hold the claim.
  - The markers were resumed for such rows where their one resume was not spent. Condition 6 lists the rest.
  - A wrong mark that names the defect a split carries from an earlier finding says the replacement does not end the break. It is a reason of its own.
  - A right mark that says the part leaves no break, or a wrong mark that names the break the carried text leaves, is a reason of its own.
- Finding 105's closing line is read as the last pass's line that the finding still breaks section E, as condition 5 says.
- The markers' stated totals that disagree with their marks are noted in `10-marks.md`, and the tables are read from the marks. Manuscript marker 1 states 39 right and 94 wrong, and its marks hold 43 and 90. Manuscript marker 2 states 37 and 96, and its marks hold 38 and 95. The grant markers state no totals.

## Helper scripts and scratch files

The session wrote these files under the scratchpad, `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad`, for the step. The brief names none of them. Its "Paths this step writes" says that outside the ledger the step writes nothing but the copies, when one must be made again, and the helper's second outputs. The six scripts are new scripts, and the user approved none of them before it was written, against the change standard's "Scripts compute facts; judgment is read".

- The six helper scripts:
  - `mk10prompts.py` builds the four marker prompts from step 8's prompts and the brief's two quoted blocks.
  - `mk10rows.py` lists the rows of each report: findings, further places, splits and list entries.
  - `mk10marks.py` parses the four marks files and the resume replies into one mark and one reason per row.
  - `mk10md.py` writes `10-marks.md` from those rows and marks. It takes the reasons of the rows named in a manuscript marker's resume from that marker's resume reply.
  - `mk10places.py` writes the place checks, runs them and prints their outputs.
  - `an10agents.py` counts the `tool_use` names of the agents' transcripts.
- The texts and notes:
  - `10-prompt-m.txt` and `10-prompt-g.txt`, the marker prompts as built.
  - `10-usage.txt`, the markers' usage from their completion notices.
  - `10-manuscript-marks-1.body`, `10-manuscript-marks-2.body`, `10-grant-marks-1.body`, `10-grant-marks-2.body`, `10-grant-marks-1-resume.body`, `10-grant-marks-2-resume.body`, `10-manuscript-marks-1-resume.body` and `10-manuscript-marks-2-resume.body`, each marker's final message as the extraction helpers saved it.
  - `10-span.txt`, the listing of the session's transcript over the run spans.
  - `10-places.md` and `10-places-sub.md`, the place checks with their outputs, the second with `<scratchpad>` in place of the path.
  - `10-report-body.md`, the draft of this report before the place checks were added.
  - `8-prompts.json`, step 8's four marker prompts taken from the transcript, which `mk10prompts.py` reads.
  - `__pycache__/mk10marks.cpython-313.pyc` and `__pycache__/mk10rows.cpython-313.pyc`, which Python wrote when the other scripts imported these two.
- The review's files: `10-refuter.body`, the refuter's report as saved, and `10-round-1-sent/`, the report and the marks page as they stood when repair round 1 was sent. The reviewer over round 1 wrote `r1-refute-delta.diff` there and `/tmp/x` outside it, each a `diff -u` of the sent report against the report after the round.
- `brief10.py` and `plan-before-spec10.md` are of the step's preparation by `/spec`, before the runs, and are not the step's.
- The helper's second outputs, which the brief names: `10-cmp/manuscript-report.md` and `10-cmp/grant-report.md`.

Every count and table these scripts produced was compared by the refuter with the marks files, the reports and the transcripts, and it found no difference.

## User-visible changes

None in the repository: the step changes no file outside the ledger. Outside the repository it wrote only the scratch files under "Helper scripts and scratch files".

## Wrong or impossible in the brief

- The brief makes the first run of every case "The builder's first task, before any change". It was not made before the runs. The unchanged tree is read from the base commit afterwards, as "The cases' first run" says.
- Nothing in the brief was impossible.

## Repair round 1

The refuter's findings (`10-refuter.md`) and the round's rulings (`agents/briefs/10-round-1.md`), each with what changed:

| Ruling | What changed |
|---|---|
| 1. Spec 1, the failure of the step's check | No change. The first line states it, and ruling J sends it to the user. |
| 2. Spec 2, the scratch files and helper scripts | A section "Helper scripts and scratch files" names every file with what it computes or holds. The first line, the DONE / NOT DONE table and "User-visible changes" state them, and that the user approved none of the six scripts. |
| 3. Spec 3, the cases' first run | The first line and the DONE / NOT DONE table name it as not done before the runs. It moved from "Judgment calls" to "Wrong or impossible in the brief". |
| 4. Spec 4, commands quoted | Conditions 3 and 6 quote each `Bash` command of the review agents and the markers whole. |
| 5. Proof 1, rows 73 and 12b | Manuscript marker 1 was resumed for row 73 (entry 44299). Its reply, `10-run/manuscript-marks-1-resume.md`, keeps the mark right with a reason of its own, and `10-marks.md` takes it. Row 12b of grant marker 2 stays without a reason of its own. Condition 6 fails on it, C8 is partial and the judgment call on reasons is stated for every marker alike. |
| 6. Proof 2, grant 2c | 2c moved to a further break of the passage the finding does not name. |
| 7. Proof 3, the spans | Condition 4 gives the manuscript span as 43415 to 43508 and the grant span as 43462 to 43566, and lists the calls they share once. |
| 8. Proof 4, the order failures | C3 and condition 2 name both: group 7 (manuscript marker 1) and group 12 (both manuscript markers). |
| 9. Standards 1, semicolons and sentence length | The running prose is rewritten in shorter sentences, and lists of rows are written as lists. |

## Fixes at landing

The run over round 1 (`10-refuter.md`, "Repair round 1, refuted") found these, each fixed at landing:

| Finding | What changed |
|---|---|
| Spec 2, the grant markers' resume commands | Condition 6 quotes each of the six commands whole. |
| Spec 3, scratch files left out | "Helper scripts and scratch files" adds `8-prompts.json`, the two `__pycache__` files and the reviewer's own two diff files, says what `mk10md.py` takes from the resume replies, and says that `brief10.py` and `plan-before-spec10.md` are of the preparation. |
| Proof 1, reasons that name only the rule and the new words | The session read the right marks of all four markers row by row against the rule on reasons. Manuscript marker 2, not yet resumed, was resumed once for its 14 such rows (entry 44460); it kept every mark and gave a reason of its own for each (`10-run/manuscript-marks-2-resume.md`). The ten marks whose markers had spent their resume are listed under condition 6, which fails on them, and the judgment call on reasons states the reading. |
| Proof 2, the resume's tokens | The manuscript markers' resume figures say "in total with its resume", here and in the resume files' header lines. |
| Proof 3, the span of the `Read` at 43551 | Condition 4 says which calls stand in both spans and that 43551 stands in the grant span only. |
| Standards 1, long sentences | The sentences the run named are split, and the lists of rows inside them are written as lists. |
| Standards 2, the state file's log line | It names three, now four, resumed markers and conditions 2, 5 and 6. |

## Files

`wc -l`, run after the last edit, from the repository root:

```
    2665 .scratch/3-the-writing-base/agents/reviews/10-marks.md
       0 .scratch/3-the-writing-base/agents/reviews/10-report.md
      83 .scratch/3-the-writing-base/agents/reviews/10-run/grant-marks-1-resume.md
     151 .scratch/3-the-writing-base/agents/reviews/10-run/grant-marks-1.md
      17 .scratch/3-the-writing-base/agents/reviews/10-run/grant-marks-2-resume.md
     234 .scratch/3-the-writing-base/agents/reviews/10-run/grant-marks-2.md
     654 .scratch/3-the-writing-base/agents/reviews/10-run/grant-report.md
      11 .scratch/3-the-writing-base/agents/reviews/10-run/manuscript-marks-1-resume.md
     197 .scratch/3-the-writing-base/agents/reviews/10-run/manuscript-marks-1.md
     106 .scratch/3-the-writing-base/agents/reviews/10-run/manuscript-marks-2-resume.md
     511 .scratch/3-the-writing-base/agents/reviews/10-run/manuscript-marks-2.md
     622 .scratch/3-the-writing-base/agents/reviews/10-run/manuscript-report.md
    5251 total
```

Verify 1, `printf '%s\0' .scratch/3-the-writing-base/agents/reviews/10-marks.md .scratch/3-the-writing-base/agents/reviews/10-report.md .scratch/3-the-writing-base/agents/reviews/10-run/* | xargs -0 perl -CSD -ne '<the check>'; echo "charset exit $?"`, printed only `charset exit 0`.

## Place checks

One command per place, its output under it. A passage part is taken from the review agent's final message as saved. It is the longest run of the quoted passage that stands on that line and holds no `'` and no character outside ASCII. `<scratchpad>` is `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad`.

### Manuscript report

Run from the main file's folder, <scratchpad>/3-2-run/manuscript.

```
# row 1, sections/abstract/abstract.tex:3 (report line 13)
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'Our results show that HCCNet substantially improves predictive accuracy and reliability over baseline models, providing a reliable tool for personalized HCC surveillance.'
1
# row 2, sections/abstract/abstract.tex:5 (report line 18)
$ sed -n '5p' sections/abstract/abstract.tex | grep -cF -- 'The methodological approach presented in this paper is versatile and can be adapted to various longitudinal MRI screening applications.'
1
# row 3, sections/abstract/abstract.tex:5 (report line 22)
$ sed -n '5p' sections/abstract/abstract.tex | grep -cF -- 'Its ability to handle varying patient record lengths and irregular screening intervals establishes it as an invaluable framework for monitoring chronic diseases, where timely and accurate disease prognosis is critical for effective treatment planning.'
1
# row 4, sections/1_introduction/introduction.tex:13 (report line 27)
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'Thus, HCCNet provides a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases.'
1
# row 5, sections/1_introduction/introduction.tex:13 (report line 32)
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can considerably influence clinical outcomes.'
1
# row 6, sections/5_discussion/discussion.tex:10 (report line 37)
$ sed -n '10p' sections/5_discussion/discussion.tex | grep -cF -- 'reliability diagrams further demonstrated that the proposed self-supervised pre-training approach aligned the models closer to the target distribution, reducing the extent to which calibration errors are propagated and amplified during fine-tuning.'
1
# row 7, sections/5_discussion/discussion.tex:10 (report line 42)
$ sed -n '10p' sections/5_discussion/discussion.tex | grep -cF -- 'Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements, the predicted risks were more reliable, demonstrating the value of our proposed pre-training framework for applications in the medical domain.'
1
# row 8, sections/5_discussion/discussion.tex:16 (report line 47)
$ sed -n '16p' sections/5_discussion/discussion.tex | grep -cF -- 'Additionally, while HCCNet demonstrates strong predictive capabilities for HCC development, its application to other diseases will require careful consideration of the specific characteristics and progression patterns of those diseases.'
1
# row 9, sections/4_experiments/d_results.tex:21 (report line 52)
$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'Improved calibration makes the models predicted scores of tumor development more reliable and more dependable for probabilistic interpretation.'
1
# row 10, sections/4_experiments/d_results.tex:21 (report line 61)
$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'reliability diagrams indicates that the proposed self-supervised pre-training reduces the expected calibration error across all three modality groups relative to the models trained with randomly initialized parameters.'
1
# row 11, sections/4_experiments/d_results.tex:5 (report line 66)
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'The combined T1 IOP \& T2-MRI modality reaches AUPRC = 0.420 and AUROC = 0.736, so the T2-MRI model alone exceeds it on AUROC (0.873 versus 0.736), indicating that concatenating the weaker T1 IOP-MRI with T2-MRI dilutes the T2 signal.'
1
# row 12, sections/5_discussion/discussion.tex:12 (report line 71)
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit, while the sequence-order-prediction task contributes comparatively little.'
1
# row 13, sections/6_conclusion/conclusion.tex:1 (report line 76)
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Beyond the original framework, an ablation of the two pre-training stages indicated that the self-supervised pre-training of the CNN backbone is the dominant driver of the observed performance gains, while the sequence-order-prediction task contributes comparatively little.'
1
# row 14, sections/4_experiments/c_evaluation.tex:8 (report line 81)
$ sed -n '8p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'To avoid over-interpreting the limited number of positive cases, we therefore refrain from drawing conclusions from differences that fall within one standard deviation across folds and treat such cases as performance ties.'
1
# row 15, sections/2_related_work/a_longitudinal_analysis.tex:1 (report line 90)
$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'To date, deep learning applications to medical imaging still predominately consider cross-sectional instead of repeated imaging data.'
1
# row 16, sections/2_related_work/a_longitudinal_analysis.tex:1 (report line 95)
$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'However,  physicians usually assess the progression of disease or the effect of treatment by comparing patients'
1
# row 17, sections/2_related_work/a_longitudinal_analysis.tex:1 (report line 100)
$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'As a result, longitudinal imaging has long been established as the gold standard in many branches of oncology, enticing recent studies to extend the analysis of medical imaging to the analysis of imaging data across time.'
1
# row 18, sections/2_related_work/a_longitudinal_analysis.tex:5 (report line 105)
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'To mitigate this shortcoming, our study uses a hybrid model architecture, which is the third most common framework in longitudinal medical image analysis.'
1
# row 19, sections/2_related_work/b_pretraining.tex:3 (report line 109)
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Among them, contrastive learning approaches remain the most commonly applied pre-training framework.'
1
# row 20, sections/3_methodology/d_pretraining.tex:1 (report line 113)
$ sed -n '1p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'When training neural networks, task agnostic pre-training has been repeatedly shown to improve performance on downstream tasks.'
1
# row 21, sections/1_introduction/introduction.tex:7 (report line 118)
$ sed -n '7p' sections/1_introduction/introduction.tex | grep -cF -- 'Likewise, most deep learning applications are aimed at detecting a malignancy, resulting in a lack of studies focusing on detecting tissue changes before the tumor actually develops.'
1
# row 22, sections/5_discussion/discussion.tex:6 (report line 123)
$ sed -n '6p' sections/5_discussion/discussion.tex | grep -cF -- 'Despite being long established as the gold standard in many branches of oncology, deep learning applications to the study of longitudinal medical images remain notoriously understudied.'
1
# row 23, sections/1_introduction/introduction.tex:7 (report line 132)
$ sed -n '7p' sections/1_introduction/introduction.tex | grep -cF -- 'However, many existing approaches have not fully explored the potential of these techniques in the context of longitudinal MRI analysis, particularly for diseases that require monitoring over extended periods \citep{parikh2020biomarkers}.'
1
# row 24, sections/2_related_work/b_pretraining.tex:1 (report line 137)
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'As a result, many deep learning studies analyzing medical images over time continue to extract 2D slices from 3D medical images to use CNN model weights pre-trained on large scale natural image datasets.'
1
# row 25, sections/2_related_work/b_pretraining.tex:1 (report line 142)
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Using the potential abundance of unlabeled data, some longitudinal medical imaging studies have therefore started to apply self-supervised pre-training approaches to enhance downstream model performance.'
1
# row 26, sections/2_related_work/a_longitudinal_analysis.tex:7 (report line 146)
$ sed -n '7p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Likewise, many of them disregard the irregular time intervals between image screenings.'
1
# row 27, sections/3_methodology/c_variants.tex:1 (report line 154)
$ sed -n '1p' sections/3_methodology/c_variants.tex | grep -cF -- 'In addition to our base model, called HCCNet-Pico, we introduce four variants of HCCNet, which are versions of about 0.5x, 0.75x, 2x, and 4x the base model'
1
# row 28, sections/abstract/abstract.tex:1 (report line 159)
$ sed -n '1p' sections/abstract/abstract.tex | grep -cF -- 'Longitudinal MRI analysis is important for predicting disease outcomes, particularly in chronic conditions like hepatocellular carcinoma (HCC), where early detection can considerably influence treatment strategies and patient prognosis.'
1
# row 29, sections/abstract/abstract.tex:3 (report line 164)
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'We additionally find that an exploratory naive fusion of imaging modalities yields only marginal gains over the strongest single modality.'
1
# row 30, sections/5_discussion/discussion.tex:12 (report line 169)
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'Finally, our exploratory multi-modal experiments show that naively fusing imaging modalities by channel concatenation provides at most marginal improvements over the strongest single modality.'
1
# row 31, sections/6_conclusion/conclusion.tex:1 (report line 173)
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Exploratory experiments further showed that naively fusing imaging modalities through channel concatenation yields at most marginal gains over the strongest single modality, suggesting that realizing the full potential of multi-modal fusion will require more structured fusion strategies, which we leave to future work.'
1
# row 32, sections/1_introduction/introduction.tex:1 (report line 178)
$ sed -n '1p' sections/1_introduction/introduction.tex | grep -cF -- 'This is especially relevant in conditions like hepatocellular carcinoma (HCC), where early detection of tissue changes and subsequent monitoring can considerably impact treatment decisions and prognosis \citep{parikh2020biomarkers}.'
1
# row 33, sections/1_introduction/introduction.tex:1 (report line 183)
$ sed -n '1p' sections/1_introduction/introduction.tex | grep -cF -- 'However, despite its potential, the development of effective predictive models that can fully exploit the temporal information in longitudinal MRI data remains a significant challenge \citep{jin2021predicting}.'
1
# row 34, sections/1_introduction/introduction.tex:5 (report line 187)
$ sed -n '5p' sections/1_introduction/introduction.tex | grep -cF -- 'Traditional approaches often simplify this task by extracting 2D slices from 3D MRI scans and applying convolutional neural networks (CNNs) pre-trained on large-scale natural image datasets \citep{kumar2024improving}.'
1
# row 35, sections/1_introduction/introduction.tex:5 (report line 191)
$ sed -n '5p' sections/1_introduction/introduction.tex | grep -cF -- 'However, this method has limitations, particularly in the medical domain where datasets are often small, and the differences between natural and medical images, such as texture, contrast, and noise, considerably impact the transferability of pre-trained models \citep{zeng2021positional}.'
1
# row 36, sections/3_methodology/a_problem_formulation.tex:1 (report line 196)
$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 's unique condition, some patients may undergo more frequent screenings than others with more or less regular time intervals between examinations.'
1
# row 37, sections/3_methodology/b_architecture.tex:5 (report line 200)
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'Additionally, we reimplement the patchify layer in ConvNeXt with a smaller kernel size and stride for the convolutional layer resulting in a 3x rather than 4x downsampling of the input images and thus accommodating for the lower input size typically encountered in volumetric data.'
1
# row 38, sections/4_experiments/d_results.tex:5 (report line 205)
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'At HCCNet-Pico, the standalone T2-MRI model (AUPRC = 0.419 and AUROC = 0.873) is markedly stronger on AUROC than the standalone T1 IOP-MRI model (AUPRC = 0.406 and AUROC = 0.703), while on AUPRC the two are comparable (around 0.42).'
1
# row 39, sections/4_experiments/d_results.tex:9 (report line 210)
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'Across model variants and imaging modalities, the per-fold ensemble closely follows the diagonal line, indicating low sensitivity to the data partitioning.'
1
# row 40, sections/4_experiments/d_results.tex:9 (report line 214)
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'This robustness is tightest on AUROC and slightly looser on AUPRC, with the largest, though still modest, fold-to-fold spread observed on the combined T1 in- and out-of-phase and T2-weighted modality.'
1
# row 41, sections/4_experiments/d_results.tex:11 (report line 219)
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'Across imaging modalities, the models are thus robust and not overly sensitive to variation across folds.'
1
# row 42, sections/4_experiments/d_results.tex:11 (report line 224)
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'This corresponds with the results presented in Table \ref{tab:finetuned_results}, which indicate that compared to the differences between imaging modalities model size only negligibly affects downstream model performance.'
1
# row 43, sections/4_experiments/d_results.tex:11 (report line 229)
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'At least on the data evaluated in this study, variations in model complexity do thus not considerably influence the quality of the models'
1
# row 44, sections/4_experiments/b_implementation.tex:9 (report line 234)
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'Owing to the limited number of positive cases and our finding that model capacity only negligibly affects downstream performance, we restrict the fusion experiments to the HCCNet-Pico variant.'
1
# row 45, sections/4_experiments/d_results.tex:19 (report line 239)
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'For the fine-tuned models, the plots largely align with the results presented in Table \ref{tab:results_base_pre}.'
1
# row 46, sections/4_experiments/d_results.tex:25 (report line 243)
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'Adding T1 DCE-MRI to DW-MRI lowers performance (AUPRC = 0.535 and AUROC = 0.873), fusing the weaker T1 IOP \& T2-MRI modality with DW-MRI leaves performance essentially equal to DW-MRI alone (AUPRC = 0.587 and AUROC = 0.891), and the full fusion of all three modality groups matches DW-MRI alone on AUROC (0.894) while landing slightly below on AUPRC (0.541).'
1
# row 47, sections/4_experiments/d_results.tex:29 (report line 252)
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'For diffusion-weighted imaging, pre-training only the CNN backbone recovers essentially all of the full pre-training gain (AUPRC = 0.672 versus 0.588 for both stages and 0.308 for the randomly initialized baseline), with the difference between the two configurations falling within one standard deviation across folds, whereas pre-training only the Transformer encoder yields AUPRC = 0.310, barely above the baseline.'
1
# row 48, sections/4_experiments/d_results.tex:29 (report line 257)
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'The CNN-backbone dominance also holds for dynamic contrast enhanced T1-weighted images, where the CNN backbone alone (AUPRC = 0.524) clearly exceeds the Transformer encoder alone (AUPRC = 0.361).'
1
# row 49, sections/4_experiments/c_evaluation.tex:8 (report line 261)
$ sed -n '8p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Since all metrics are obtained through cross-validation, we note that the five fold-level estimates are not fully independent: consecutive folds share the majority of their development data, so the reported standard deviations should be interpreted as a measure of fold-to-fold variability rather than as an unbiased estimate of the true standard error, which they are likely to slightly understate.'
1
# row 50, sections/appendix/a_implementation/3_hyperparams.tex:3 (report line 266)
$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'Note that during CNN-backbone pre-training we slightly deviate from the hyperparameter settings proposed in \citep{caronEmergingPropertiesSelfSupervised2021}.'
1
# row 51, sections/appendix/a_implementation/3_hyperparams.tex:3 (report line 271)
$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 's output dimensionality to 1024 classes and reduced the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$.'
1
# row 52, sections/appendix/b_additional_results/1_baseline.tex:3 (report line 275)
$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'Overall differences between imaging modalities are however far less pronounced than for the models intialized with SSL pre-trained weighted (s. Table \ref{tab:finetuned_results}) and the overall diagnostic performance remains generally poor.'
1
# row 53, sections/appendix/b_additional_results/2_reliability.tex:3 (report line 280)
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'As for the comparison across performance metrics depicted in Table \ref{tab:results_base_pre}, variations in reliability scores are predominantly driven by imaging modality rather than model complexity.'
1
# row 54, figures/cumulative_gain.tex:10 (report line 284)
$ sed -n '10p' figures/cumulative_gain.tex | grep -cF -- 'Generally, lower MAE values indicate greater robustness to fold-to-fold variation, while higher MAE values signify greater sensitivity to the data partitioning.'
1
# row 55, sections/4_experiments/b_implementation.tex:7 (report line 289)
$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We employ the same optimizer, learning rate schedule, number of training steps, batch size, and further hyper-parameter settings as during fine-tuning but slightly increase the learning rate warm-up (i.e., from 20 to 40 training steps) to ensure a more stable convergence.'
1
# row 56, sections/3_methodology/d_pretraining.tex:1 (report line 294)
$ sed -n '1p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Additionally, subset $V^{(p,t)}$ contains only roughly 75\% of observations included in superset $D^{(p,t)}$.'
1
# row 57, sections/4_experiments/a_data.tex:1 (report line 302)
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'We evaluate HCCNet on data that is retrospectively collected from a cohort of liver cirrhosis patients who underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022 at Medisch Spectrum Twente (MST) in Enschede, the Netherlands.'
1
# row 58, sections/5_discussion/discussion.tex:8 (report line 311)
$ sed -n '8p' sections/5_discussion/discussion.tex | grep -cF -- 'Our proposed pre-training approach improved model performance by up to 147.1\% for models fine-tuned using diffusion-weighted MR images and yielded substantial improvements as well for models fine-tuned on the dynamic contrast-enhanced T1-weighted and the combined T1 in- and out-of-phase and T2-weighted modalities.'
1
# row 59, sections/5_discussion/discussion.tex:8 (report line 316)
$ sed -n '8p' sections/5_discussion/discussion.tex | grep -cF -- 'Overall, fine-tuned model results varied substantially across imaging modalities.'
1
# row 60, main.tex:45 (report line 325)
$ sed -n '45p' main.tex | grep -cF -- '\title{HCCNet: A Self-Supervised CNN-Transformer for Disease Prognosis from Longitudinal 3D MRI, with a Case Study on Hepatocellular Carcinoma}'
1
# row 61, sections/abstract/abstract.tex:1 (report line 329)
$ sed -n '1p' sections/abstract/abstract.tex | grep -cF -- 'To address this, we propose HCCNet, a novel model architecture that integrates a 3D adaptation of the ConvNeXt CNN architecture with a Transformer encoder, capturing both the fine-grained spatial features of 3D MRIs and the complex temporal dependencies across different time points.'
1
# row 62, sections/1_introduction/introduction.tex:11 (report line 334)
$ sed -n '11p' sections/1_introduction/introduction.tex | grep -cF -- 'The CNN backbone is pre-trained using an extended version of the DINO framework, adapted to 3D MRI, which treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}.'
1
# row 63, sections/3_methodology/b_architecture.tex:14 (report line 339)
$ sed -n '14p' sections/3_methodology/b_architecture.tex | grep -cF -- 'The Transformer encoder is based on the Pre-LN implementation \citep{xiongLayerNormalizationTransformer2020}'
1
# row 64, sections/4_experiments/b_implementation.tex:3 (report line 343)
$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'While MRI scans are assumed to be i.i.d. during CNN pre-training, pre-training of the Transformer encoder considers the within-person dependencies across time points.'
1
# row 65, sections/3_methodology/c_variants.tex:1 (report line 354)
$ sed -n '1p' sections/3_methodology/c_variants.tex | grep -cF -- 'The five model variations are:'
1
# row 66, sections/4_experiments/c_evaluation.tex:1 (report line 356)
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'For the comparison across model variations'
1
# row 67, sections/4_experiments/d_results.tex:5 (report line 358)
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'stratified by imaging modality and model architecture'
1
# row 68, sections/4_experiments/d_results.tex:5 (report line 360)
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'across model architectures'
1
# row 69, sections/4_experiments/d_results.tex:9 (report line 362)
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- '\textbf{Comparison across Model Variations.}'
1
# row 70, sections/4_experiments/d_results.tex:9 (report line 364)
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'we explore the impact of varying model complexity on HCC risk prediction'
1
# row 71, sections/4_experiments/d_results.tex:11 (report line 366)
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'the plots reveal no consistent differences across model architecture, as no model variant is persistently deviating from the optimal diagonal line'
1
# row 72, sections/4_experiments/d_results.tex:15 (report line 368)
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'stratified by image modality and model variation'
1
# row 73, sections/appendix/b_additional_results/1_baseline.tex:3 (report line 370)
$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'stratified by image modality and model variation'
1
# row 74, sections/appendix/b_additional_results/2_reliability.tex:3 (report line 372)
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'stratified by imaging modality and model architecture'
1
# row 75, tables/hyperparams.tex:36 (report line 374)
$ sed -n '36p' tables/hyperparams.tex | grep -cF -- 'for model variations HCCNet-F, -C, and -P'
1
# row 76, sections/3_methodology/b_architecture.tex:5 (report line 378)
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- '\textbf{CNN Feature Extractor.}'
1
# row 77, sections/3_methodology/b_architecture.tex:7 (report line 380)
$ sed -n '7p' sections/3_methodology/b_architecture.tex | grep -cF -- 'The CNN feature extractor takes the MR images as inputs'
1
# row 78, sections/3_methodology/b_architecture.tex:14 (report line 382)
$ sed -n '14p' sections/3_methodology/b_architecture.tex | grep -cF -- 'the image embeddings obtained from the CNN feature extractor'
1
# row 79, sections/3_methodology/d_pretraining.tex:3 (report line 384)
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- '\textbf{CNN Feature Extractor.}'
1
# row 80, sections/3_methodology/d_pretraining.tex:10 (report line 386)
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we keep the parameters of the CNN feature extractor fixed'
1
# row 81, sections/appendix/a_implementation/2_augmentations.tex:1 (report line 388)
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'During pre-training of the CNN feature extractor'
1
# row 82, tables/results_pretrain_ablation.tex:27 (report line 390)
$ sed -n '27p' tables/results_pretrain_ablation.tex | grep -cF -- 'pre-trains the CNN feature extractor using DINO'
1
# row 83, sections/3_methodology/d_pretraining.tex:1 (report line 398)
$ sed -n '1p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'To fully use all available data and improve the representations learned during training, we therefore design two (self-)supervised pre-training tasks for both the CNN backbone and the Transformer encoder prior to training on our downstream task.'
1
# row 84, sections/3_methodology/d_pretraining.tex:3 (report line 400)
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'For the CNN backbone, this study extends the self-supervised DINO pre-training framework described in \citep{caronEmergingPropertiesSelfSupervised2021} to 3D MR images.'
1
# row 85, sections/3_methodology/d_pretraining.tex:8 (report line 402)
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views.'
1
# row 86, sections/3_methodology/d_pretraining.tex:8 (report line 404)
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Besides that, our implementation also proposes a novel augmentation strategy specific to MR images.'
1
# row 87, sections/3_methodology/d_pretraining.tex:8 (report line 406)
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This teaches the model to identify the same patient under varying acquisition conditions.'
1
# row 88, sections/3_methodology/d_pretraining.tex:10 (report line 408)
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 's understanding of disease progression, this study employs a simple binary sequence-order-prediction (SOP) task inspired by \citep{lanALBERTLiteBERT2020}.'
1
# row 89, sections/3_methodology/d_pretraining.tex:10 (report line 410)
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'During the SOP pre-training, we keep the parameters of the CNN feature extractor fixed and initialize them using the previously pre-trained weights.'
1
# row 90, sections/3_methodology/d_pretraining.tex:15 (report line 412)
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Note that during pre-training of the Transformer encoder we do not randomly crop multiple views from the same image but instead only crop a single view of shape $s = 72^3$ from the original MRI.'
1
# row 91, sections/3_methodology/d_pretraining.tex:15 (report line 414)
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Likewise, we concatenate the different series in the sequence of MRI scans to a multi-channel volume instead of randomly selecting a single one.'
1
# row 92, sections/3_methodology/d_pretraining.tex:15 (report line 416)
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Since the backbone is pre-trained on single-channel views, we reconcile the differing input dimensionality by expanding the pre-trained single-channel stem to the required number of input channels: the learned stem filters are replicated across the input series to initialize the first convolutional layer, which is then fine-tuned end to end.'
1
# row 93, sections/4_experiments/b_implementation.tex:1 (report line 420)
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'As aforementioned, we pre-train both the CNN backbone and the Transformer encoder on development superset $D_p^{\text{dev}}$.'
1
# row 94, sections/4_experiments/b_implementation.tex:1 (report line 422)
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We train the CNN over 32000 training steps using the AdamW optimizer \citep{loshchilovDecoupledWeightDecay2019} with an effective batch size of $b = 128$.'
1
# row 95, sections/4_experiments/b_implementation.tex:1 (report line 424)
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'After reaching its maximum value, we decay the learning rate using a cosine schedule.'
1
# row 96, sections/4_experiments/b_implementation.tex:1 (report line 426)
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'Contrary to the original DINO implementation, we also limit the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$ and increase the initial exponential moving average momentum to $m = 0.9995$.'
1
# row 97, sections/4_experiments/b_implementation.tex:5 (report line 428)
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'During fine-tuning, we update HCCNet on the development subset $V_p^{\text{dev}}$.'
1
# row 98, sections/4_experiments/b_implementation.tex:5 (report line 430)
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 's development subset $V_p^{\text{dev}}$ using the same default hyper-parameter settings as during Transformer encoder pre-training and evaluate it on the corresponding held-out fold.'
1
# row 99, sections/4_experiments/b_implementation.tex:11 (report line 432)
$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We conduct this ablation on the HCCNet-Pico variant across all three modality groups using the same five-fold protocol.'
1
# row 100, sections/4_experiments/d_results.tex:5 (report line 436)
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'HCCNet trained using diffusion weighted MR images shows excellent predictive capability of tumor development with an average $\text{AUPRC} = 0.614$ and $\text{AUROC} = 0.901$ across model architectures.'
1
# row 101, sections/4_experiments/d_results.tex:5 (report line 438)
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'At the group level, the combined modality nonetheless remains the weakest of the three groups.'
1
# row 102, sections/4_experiments/d_results.tex:9 (report line 440)
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'No model variant falls consistently below the diagonal line.'
1
# row 103, sections/4_experiments/d_results.tex:15 (report line 442)
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'Across imaging modalities, the magnitude of the improvement from our proposed approach varies.'
1
# row 104, sections/4_experiments/d_results.tex:19 (report line 444)
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'For the randomly initialized baseline, however, the expected calibration error does not display the same negative relationship with model performance.'
1
# row 105, sections/4_experiments/d_results.tex:21 (report line 446)
$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'This reduction is largest for diffusion weighted MR images at 56.0\%, reaches 37.0\% for dynamic contrast enhanced T1-weighted MRIs, and is smallest at 12.1\% for the already well-calibrated combined T1 in- and out-of-phase and T2-weighted modality.'
1
# row 106, sections/4_experiments/d_results.tex:25 (report line 448)
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'None of the fused configurations exceeds this best single modality.'
1
# row 107, sections/4_experiments/d_results.tex:29 (report line 450)
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'These results indicate that the self-supervised pre-training of the CNN backbone is the dominant driver of the observed pre-training effects for diffusion-weighted and dynamic contrast enhanced T1-weighted imaging.'
1
# row 108, sections/4_experiments/d_results.tex:15 (report line 456)
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'Finally, we evaluate the impact of our proposed pre-training approach on model performance.'
1
# row 109, sections/4_experiments/d_results.tex:9 (report line 461)
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'As such, Figure \ref{fig:cumulative_gain} plots the cumulative gain in normalized AUPRC and AUROC against the test results obtained over the five cross-validation folds and ordered by ascending cumulative gain.'
1
# row 110, sections/5_discussion/discussion.tex:12 (report line 469)
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'We attribute this to the limited number of positive cases and the additional registration burden incurred when concatenating series acquired across separate sequences, and view structured fusion strategies that explicitly account for the distinct characteristics of each modality as a promising avenue for future work.'
1
# row 111, sections/3_methodology/d_pretraining.tex:15 (report line 474)
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This transfers the pre-trained representation to inputs comprising an arbitrary number of series without re-initializing the first convolutional layer from scratch.'
1
# row 112, sections/appendix/a_implementation/3_hyperparams.tex:3 (report line 478)
$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'This is due to convergence issues that we noted during initial model runs.'
1
# row 113, sections/4_experiments/d_results.tex:3 (report line 486)
$ sed -n '3p' sections/4_experiments/d_results.tex | grep -cF -- 's fine-tuned performance (i) across imaging modalities, (ii) model variations, and (iii) against a randomly initialized baseline.'
1
# row 114, sections/3_methodology/b_architecture.tex:5 (report line 490)
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 's 3D implementation of ConvNeXt are presented in \ref{sec:appendix_conv_layer}.'
1
# row 115, sections/abstract/abstract.tex:3 (report line 498)
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'The CNN backbone is pre-trained using a self-supervised learning framework adapted for 3D MRIs, while the Transformer encoder is pre-trained with a sequence-order-prediction task to enhance its understanding of disease progression over time.'
1
# row 115, sections/abstract/abstract.tex:3 (report line 498)
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'We demonstrate the effectiveness of HCCNet by applying it to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance.'
1
# row 116, sections/1_introduction/introduction.tex:13 (report line 505)
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can considerably influence clinical outcomes.'
1
# row 116, sections/1_introduction/introduction.tex:13 (report line 505)
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'The methodological approach presented in this paper can also be considered for predicting other conditions that, similar to HCC, benefit from monitoring changes over time.'
1
# row 117, sections/2_related_work/a_longitudinal_analysis.tex:3 (report line 512)
$ sed -n '3p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'While the approach is relatively simple to implement, it has been shown to not fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}.'
1
# row 117, sections/2_related_work/a_longitudinal_analysis.tex:3 (report line 512)
$ sed -n '3p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Studies investigating treatment effects have therefore increasingly employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}.'
1
# row 118, sections/2_related_work/a_longitudinal_analysis.tex:5 (report line 520)
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Compared to the aforementioned approaches, hybrid models can handle patient records of varying time points, making them especially suited for the continued surveillance of patients at high-risk of disease or after the onset of treatment.'
1
# row 118, sections/2_related_work/a_longitudinal_analysis.tex:5 (report line 520)
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'As such, they have been successfully employed in response prediction to radiotherapy \citep{leeDeepLearningDriven2022, wangPredictingEvolutionLung2019, wangPredictingSpatialEsophageal2020, xuDeepLearningPredicts2019} and endothelial therapy \citep{luDeepLearningPrediction2021} as well as in breast cancer risk prediction \citep{dadsetanDeepLearningLongitudinal2022}.'
1
# row 119, sections/2_related_work/b_pretraining.tex:3 (report line 528)
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'As such, they randomly derive different views from the same input image \citep{chenSimpleFrameworkContrastive2020} or from the same patient at different time points and learn rich contextual feature embeddings by matching the view'
1
# row 119, sections/2_related_work/b_pretraining.tex:3 (report line 528)
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- '\cite{jamaludinSelfsupervisedLearningSpinal2017}, for example, pre-trained a Siamese CNN on baseline and follow-up image pairs by minimizing the distance between view pairs from the same patient and maximizing the distance between images from different patients.'
1
# row 120, sections/3_methodology/d_pretraining.tex:8 (report line 535)
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views.'
1
# row 120, sections/3_methodology/d_pretraining.tex:8 (report line 535)
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Besides that, our implementation also proposes a novel augmentation strategy specific to MR images.'
1
# row 120 split 2, sections/3_methodology/d_pretraining.tex:8 (report line 541)
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'For a view cropped from a Diffusion-Weighted MRI (DW-MRI), we randomly sample one series among the diffusion coefficients $b \in \{0, 150, 400, 800\}$; for dynamic contrast-enhanced T1-weighted MRIs (T1 DCE-MRI) we sample among the pre- and post-contrast phases; and for the combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI) we sample within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series).'
1
# row 121, sections/4_experiments/a_data.tex:1 (report line 547)
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'Prior to pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing.'
1
# row 121, sections/4_experiments/a_data.tex:1 (report line 547)
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'All examinations included in the study comprise the complete set of imaging sequences, such that the diffusion-weighted, the dynamic contrast-enhanced T1-weighted, and the combined T1 in- and out-of-phase and T2-weighted modality groups are available for every patient.'
1
# row 122, sections/4_experiments/a_data.tex:3 (report line 554)
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'During fine-tuning we additionally exclude all patients without a definitive diagnosis of HCC yielding a total of 243 patients of which 37 develop HCC (i.e., 703 and 101 total MRI examinations respectively).'
1
# row 122, sections/4_experiments/a_data.tex:3 (report line 554)
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'To obtain robust performance estimates despite the limited number of positive cases, we evaluate HCCNet using stratified 5-fold cross-validation rather than a single hold-out split.'
1
# row 122 split 2, sections/4_experiments/a_data.tex:3 (report line 560)
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'Each fold serves as the held-out test set $D^{\text{test}}_p$ exactly once, while the remaining four folds form the development set $D^{\text{dev}}_p$ that is used for both pre-training and fine-tuning.'
1
# row 122 split 2, sections/4_experiments/a_data.tex:3 (report line 560)
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'The full modeling pipeline (self-supervised pre-training of the CNN backbone and Transformer encoder, fine-tuning, and baseline training) is repeated independently for each fold using only the data of its development set.'
1
# row 123, sections/4_experiments/b_implementation.tex:9 (report line 566)
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'Concretely, we evaluate the full fusion of all three modality groups (DW-MRI, T1 DCE-MRI, and T1 IOP \& T2-MRI; twelve input channels) as well as the two pairings that include the strongest single modality, namely DW-MRI + T1 DCE-MRI and DW-MRI + T1 IOP \& T2-MRI (eight input channels each).'
1
# row 123, sections/4_experiments/b_implementation.tex:9 (report line 566)
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'As during single-modality pre-training, augmentation views are sampled within a single contrast family.'
1
# row 124, sections/4_experiments/c_evaluation.tex:1 (report line 577)
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Every reported metric is computed on this per-fold ensemble prediction, and we report its mean and standard deviation across the five cross-validation folds.'
1
# row 124, sections/4_experiments/c_evaluation.tex:1 (report line 577)
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'For evaluation, we employ the following performance metrics: accuracy, precision, recall, F1-score, area under the receiver operating characteristic (AUROC), and area under the precision-recall curve (AUPRC).'
1
# row 125, sections/4_experiments/d_results.tex:19 (report line 584)
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'Figure \ref{fig:calibration} shows consistently lower expected calibration errors among models fine-tuned using diffusion weighted MR images and the highest expected calibration errors among models fine-tuned on dynamic contrast enhanced T1-weighted MRIs, with the combined T1 in- and out-of-phase and T2-weighted MRIs falling in between.'
1
# row 125, sections/4_experiments/d_results.tex:19 (report line 584)
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'For the randomly initialized baseline, however, the expected calibration error does not display the same negative relationship with model performance.'
1
# row 126, sections/6_conclusion/conclusion.tex:1 (report line 592)
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'The methodology is versatile and offers a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes.'
1
# row 126, sections/6_conclusion/conclusion.tex:1 (report line 592)
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Yet, each condition presents its own unique challenges in terms of disease progression and imaging characteristics, which will require further adaptation of the HCCNet framework.'
1
# row 126 split 2, sections/6_conclusion/conclusion.tex:1 (report line 598)
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'In the future, we therefore plan to validate our findings on an external validation cohort and aim to incorporate multi-modal data to further improve upon our results.'
1
# row 127, sections/appendix/b_additional_results/2_reliability.tex:3 (report line 601)
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'That is despite that baseline models trained using diffusion weighted MRIs show the best average discriminatory power between patients of low and high risk of HCC.'
1
# row 127, sections/appendix/b_additional_results/2_reliability.tex:3 (report line 601)
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'Contrarily, for the fine-tuned models, preceding pre-training establishes a negative relationship between performance and reliability metrics.'
1
# row 128, sections/6_conclusion/ack.tex:6 (report line 612)
$ sed -n '6p' sections/6_conclusion/ack.tex | grep -cF -- '(OpenAI ChatGPT) to help'
1
# row 129, sections/6_conclusion/ack.tex:7 (report line 616)
$ sed -n '7p' sections/6_conclusion/ack.tex | grep -cF -- 'the authors reviewed and edited the'
1
# row 130, sections/6_conclusion/ack.tex:2 (report line 620)
$ sed -n '2p' sections/6_conclusion/ack.tex | grep -cF -- 'op basis van MRI-radiomics'
1
```

### Grant report

Run from the scratchpad, <scratchpad>.

```
# row 1a, paragraph 35 (report line 11)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'If it does, surveillance can warn within the curative window.'
1
# row 1b, paragraph 48 (report line 16)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett'
1
# row 2a, paragraph 8 (report line 27)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^8: ' | grep -cF -- 'Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure.'
1
# row 2b, paragraph 11 (report line 34)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^11: ' | grep -cF -- 'Leverkanker ontstaat meestal in een verlittekende, cirrotische lever, en scans vinden een tumor pas als die zichtbaar is, vaak te laat om te genezen.'
1
# row 2c, paragraph 34 (report line 41)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Problem and opportunity. Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1], and imaging surveillance is meant to catch it while cure is still possible [2].'
1
# row 2d, paragraph 34 (report line 48)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window.'
1
# row 2e, paragraph 34 (report line 53)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied.'
1
# row 2f, paragraph 40 (report line 60)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection.'
1
# row 2g, paragraph 41 (report line 73)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1).'
1
# row 2h, paragraph 42 (report line 85)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study.'
1
# row 2i, paragraph 45 (report line 98)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^45: ' | grep -cF -- 's serial MRI before diagnosis is reduced to a few interpretable components of the background liver.'
1
# row 3a, paragraph 35 (report line 107)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients).'
1
# row 3b, paragraph 8 (report line 115)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^8: ' | grep -cF -- 'This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver'
1
# row 3c, paragraph 19 (report line 122)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^19: ' | grep -cF -- 'Postdoc (applicant), 0,42 FTE, 12 months, UNL CAO table'
1
# row 3d, paragraph 31 (report line 127)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 's own postdoctoral salary across the full twelve months (UNL CAO table) to build the interpretable background-liver components, run the trajectory analysis, deliver the pre-registered primary endpoint and release the background-liver atlas.'
1
# row 3e, paragraph 35 (report line 140)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'Whether it reflects a diffuse malignant field or a focal precursor is the exploratory question of C3.'
1
# row 3f, paragraph 35 (report line 146)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout'
1
# row 3g, paragraph 41 (report line 154)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference.'
1
# row 3h, paragraph 46 (report line 162)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^46: ' | grep -cF -- 'Overlapping work packages: WP1 (mo 1-4) aligns the scans and builds the components (if point-by-point alignment fails the alignment check, averages per liver segment are used instead), obtains the detection limit from inserted changes of known size, deposits the pre-registration and writes the data-management plan; WP2 (mo 3-8, primary) prepares and, after the deposit, runs the confirmatory test; WP3 (mo 7-11) runs the exploratory location test; WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data).'
1
# row 4a, paragraph 41 (report line 184)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test.'
1
# row 5a, paragraph 40 (report line 194)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans.'
1
# row 6a, paragraph 47 (report line 203)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^47: ' | grep -cF -- 's signal to a common range, a scan-year covariate and same-year matching. (iv) Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check, with the excluded studies described to show whether it removes the most diseased livers, and the random reassignment of diagnosis dates.'
1
# row 7a, paragraph 46 (report line 219)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^46: ' | grep -cF -- 'The applicant works at 0,42 FTE across all twelve months on a cohort that is already available, using open-source image-alignment software [12] and established methods for such component summaries [9].'
1
# row 7b, paragraph 31 (report line 225)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 's standing appointment covers the remaining time.'
1
# row 7c, paragraph 31 (report line 230)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'Computing is provided by the host institution at no cost, so none is requested.'
1
# row 7d, paragraph 41 (report line 235)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status.'
1
# row 7e, paragraph 41 (report line 241)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2.'
1
# row 7f, paragraph 42 (report line 247)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1.'
1
# row 7g, paragraph 42 (report line 253)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations).'
1
# row 7h, paragraph 42 (report line 259)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'The primary test is repeated in the 5 patients with no recorded decompensation by their tested study.'
1
# row 7i, paragraph 42 (report line 264)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels.'
1
# row 7j, paragraph 49 (report line 269)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^49: ' | grep -cF -- 'The atlas (component definitions, summary maps and code) contains no patient-level data and will be released openly.'
1
# row 8a, paragraph 35 (report line 279)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis.'
1
# row 8b, paragraph 42 (report line 285)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis.'
1
# row 8c, paragraph 43 (report line 291)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^43: ' | grep -cF -- 'Success means the future tumour segment ranks above these random relabellings.'
1
# row 9a, paragraph 40 (report line 300)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Approach. The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe).'
1
# row 9b, paragraph 40 (report line 305)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC.'
1
# row 9c, paragraph 40 (report line 310)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study.'
1
# row 9d, paragraph 40 (report line 316)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set.'
1
# row 9e, paragraph 41 (report line 321)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 's earlier studies so that the same point of the liver overlaps across scans [12], and exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place.'
1
# row 9f, paragraph 41 (report line 327)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more.'
1
# row 9g, paragraph 42 (report line 332)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 's earlier usable studies, in units of the ordinary scan-to-scan variation of stable livers, expressed as a standard deviation.'
1
# row 9h, paragraph 42 (report line 337)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study.'
1
# row 9i, paragraph 42 (report line 342)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3.'
1
# row 9j, paragraph 42 (report line 347)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect.'
1
# row 9k, paragraph 43 (report line 353)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^43: ' | grep -cF -- 'We test whether the change is larger in that segment than when the tumour label is moved at random among the same patient'
1
# row 9l, paragraph 34 (report line 358)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue.'
1
# row 9m, paragraph 34 (report line 363)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand.'
1
# row 9n, paragraph 35 (report line 369)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient'
1
# row 9o, paragraph 48 (report line 374)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13], and computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8].'
1
# row 9p, paragraph 11 (report line 379)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^11: ' | grep -cF -- 'Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt.'
1
# row 10a, paragraph 48 (report line 389)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4].'
1
# row 11a, paragraph 42 (report line 398)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered.'
1
# row 11b, paragraph 42 (report line 409)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient'
1
# row 12a, paragraph 8 (report line 425)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^8: ' | grep -cF -- 'Cancer is thought to arise from gradual change across the whole diseased liver.'
1
# row 12a, paragraph 8 (report line 425)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^8: ' | grep -cF -- 'This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver'
1
# row 12b, paragraph 11 (report line 432)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^11: ' | grep -cF -- 'Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever.'
1
# row 12b, paragraph 11 (report line 432)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^11: ' | grep -cF -- 'Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt.'
1
# row 12c Break 1, paragraph 31 (report line 440)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 's standing appointment covers the remaining time.'
1
# row 12c Break 1, paragraph 31 (report line 440)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'Computing is provided by the host institution at no cost, so none is requested.'
1
# row 12c Break 2, paragraph 31 (report line 445)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'Dissemination covers open-access publication charges and the costs of the openly released atlas.'
1
# row 12c Break 2, paragraph 31 (report line 445)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^31: ' | grep -cF -- 'The longitudinal MRI cohort is already available under a data agreement, so no data-acquisition costs arise.'
1
# row 12d Break 1, paragraph 34 (report line 452)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window.'
1
# row 12d Break 1, paragraph 34 (report line 452)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue.'
1
# row 12d Break 2, paragraph 34 (report line 457)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6].'
1
# row 12d Break 2, paragraph 34 (report line 457)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied.'
1
# row 12d Break 3, paragraph 34 (report line 462)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied.'
1
# row 12d Break 3, paragraph 34 (report line 462)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand.'
1
# row 12e Break 1, paragraph 35 (report line 469)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient'
1
# row 12e Break 1, paragraph 35 (report line 469)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients).'
1
# row 12e Break 2, paragraph 35 (report line 474)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients).'
1
# row 12e Break 2, paragraph 35 (report line 474)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis.'
1
# row 12e Break 3, paragraph 35 (report line 479)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'A within-patient analysis adjusted for decompensation (the stage at which the scarred liver begins to fail and complications appear) gives supporting evidence.'
1
# row 12e Break 3, paragraph 35 (report line 479)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'The claim is predictive: the change precedes the tumour.'
1
# row 12e Break 4, paragraph 35 (report line 484)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'Molecular confirmation lies outside this project.'
1
# row 12e Break 4, paragraph 35 (report line 484)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'Whether such change exceeds the scan-to-scan variation of cirrhotic tissue is unknown, which makes the project high-risk.'
1
# row 12e Break 5, paragraph 35 (report line 489)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'If it does, surveillance can warn within the curative window.'
1
# row 12e Break 5, paragraph 35 (report line 489)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^35: ' | grep -cF -- 'The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout'
1
# row 12f Break 1, paragraph 40 (report line 496)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Approach. The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe).'
1
# row 12f Break 1, paragraph 40 (report line 496)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC.'
1
# row 12f Break 2, paragraph 40 (report line 501)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC.'
1
# row 12f Break 2, paragraph 40 (report line 501)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection.'
1
# row 12f Break 3, paragraph 40 (report line 510)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans.'
1
# row 12f Break 3, paragraph 40 (report line 510)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study.'
1
# row 12f Break 4, paragraph 40 (report line 515)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study.'
1
# row 12f Break 4, paragraph 40 (report line 515)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^40: ' | grep -cF -- 'Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set.'
1
# row 12g Break 1, paragraph 41 (report line 522)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 's earlier studies so that the same point of the liver overlaps across scans [12], and exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place.'
1
# row 12g Break 1, paragraph 41 (report line 522)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference.'
1
# row 12g Break 2, paragraph 41 (report line 527)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference.'
1
# row 12g Break 2, paragraph 41 (report line 527)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The analyst receives only studies taken before diagnosis (see C2).'
1
# row 12g Break 3, paragraph 41 (report line 532)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The analyst receives only studies taken before diagnosis (see C2).'
1
# row 12g Break 3, paragraph 41 (report line 532)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1).'
1
# row 12g Break 4, paragraph 41 (report line 540)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1).'
1
# row 12g Break 4, paragraph 41 (report line 540)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more.'
1
# row 12g Break 5, paragraph 41 (report line 548)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more.'
1
# row 12g Break 5, paragraph 41 (report line 548)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status.'
1
# row 12g Break 6, paragraph 41 (report line 553)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status.'
1
# row 12g Break 6, paragraph 41 (report line 553)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2.'
1
# row 12g Break 7, paragraph 41 (report line 558)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2.'
1
# row 12g Break 7, paragraph 41 (report line 558)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^41: ' | grep -cF -- 'Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test.'
1
# row 12h Break 1, paragraph 42 (report line 565)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study.'
1
# row 12h Break 1, paragraph 42 (report line 565)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3.'
1
# row 12h Break 2, paragraph 42 (report line 570)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3.'
1
# row 12h Break 2, paragraph 42 (report line 570)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1.'
1
# row 12h Break 3, paragraph 42 (report line 575)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1.'
1
# row 12h Break 3, paragraph 42 (report line 575)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study.'
1
# row 12h Break 4, paragraph 42 (report line 584)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study.'
1
# row 12h Break 4, paragraph 42 (report line 584)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'With 8 patients against 148 never-HCC patients, the smallest detectable effect is 0.91 standard deviations (80 percent power, one-sided alpha 0.05).'
1
# row 12h Break 5, paragraph 42 (report line 593)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations).'
1
# row 12h Break 5, paragraph 42 (report line 593)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'The primary test is repeated in the 5 patients with no recorded decompensation by their tested study.'
1
# row 12h Break 6, paragraph 42 (report line 598)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient'
1
# row 12h Break 6, paragraph 42 (report line 598)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect.'
1
# row 12h Break 7, paragraph 42 (report line 606)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect.'
1
# row 12h Break 7, paragraph 42 (report line 606)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered.'
1
# row 12h Break 8, paragraph 42 (report line 615)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels.'
1
# row 12h Break 8, paragraph 42 (report line 615)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^42: ' | grep -cF -- 'Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis.'
1
# row 12i Break 1, paragraph 48 (report line 622)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13], and computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8].'
1
# row 12i Break 1, paragraph 48 (report line 622)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4].'
1
# row 12i Break 2, paragraph 48 (report line 627)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4].'
1
# row 12i Break 2, paragraph 48 (report line 627)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components.'
1
# row 12i Break 3, paragraph 48 (report line 632)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components.'
1
# row 12i Break 3, paragraph 48 (report line 632)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^48: ' | grep -cF -- 'If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett'
1
# row 13a, paragraph 34 (report line 642)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^34: ' | grep -cF -- 'Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6].'
1
# row 14a, paragraph 64 [word/header1.xml] (report line 651)
$ python3 -I '/Users/axelfaes/.local/share/ordo-stable/skills/writing/templates/docx_paragraphs.py' '<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx' | grep -E '^64: ' | grep -cF -- 'NWO Open Competition Domain Science'
1
```


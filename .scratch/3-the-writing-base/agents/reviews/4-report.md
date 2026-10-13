NOT DONE: the step's check does not hold. Of the manuscript run's findings, 35 are not marked right by both markers, and of the grant run's, 29. Gate conditions 1, 2, 3 (manuscript run), 5 and 6 fail on the runs. Conditions 4 and 7 hold. The brief's "Verify before you report" 4 prints one line, the round brief that `plan-orchestration` copies into the worktree's ledger. Each failure is listed under "The gate conditions" below. Open item H raised them, and the user ruled (a): steps 5 and 6 are added and the closing becomes step 7.

# Report of step 4 of plan 3, the repeated runs of /writing

## Open items of the state file

none

Open item H, which this step raised, stands in the state file's closed items and in `plan.md`'s Rulings as ruled (a) by the user.

## The cases' first run

`ls .scratch/3-the-writing-base/agents/reviews/4-run .scratch/3-the-writing-base/agents/reviews/4-marks.md`, run before the copies, printed `No such file or directory` for both, for all nine cases. After the step:

- C1: not met. Of the manuscript report's 228 place checks under "Place checks", 227 print `1`. The tense-list clause at `sections/4_experiments/c_evaluation.tex:1` that names finding 39's sentence prints `0`, since that sentence stands at line 6. The 27 tense-list places listed under condition 1 give the file name without its folder. Of the grant report's 67 place checks, 66 print `1`, and paragraph 35 split (b) prints `0`.
- C2: met except paragraph 35 split (b), whose first quoted sentence is finding 4's replacement and not the draft's text.
- C3: not met. Groups are named by page and section and each has a line, but both markers of the manuscript name three lines and both markers of the grant name two lines that do not name what the reader loses.
- C4: not met for the manuscript. Finding 83 quotes no passage, by both markers. Finding 68 names the sentence before its break by reference. Marker 2 names that missing quote and marker 1 does not. The grant: met.
- C5: met for the grant. Not met for the manuscript, whose review agent ran a second `Bash` command of term greps beside the character-set grep.
- C6: met for both. The manuscript agent read the three pages and all 33 files with `Read` (36 distinct files), and the grant agent read the three pages and ran the script.
- C7: met for both, with the evidence under condition 4 below.
- C8: partial. Every finding has two marks from two fresh agents per run, none of them a review agent, each `ordo-high` served `claude-opus-5-5`. The manuscript markers were given the report by path (Open item G, C70). Manuscript marker 1 read 17 of the 33 draft files with `Read` and the other 16 with `cat -n` in `Bash`, so its reading is not the reading the brief asks for. Marker 2 read all 33 with `Read`.
- C9: met as a record. `4-marks.md` has one row per finding, place, split and tense clause, and lists the 35 and 29 findings not marked right by both, each with both reasons. The step's check therefore does not hold.

## DONE / NOT DONE

| Check | Result |
|---|---|
| Copies made and equal before the runs | DONE: `diff exit 0`, `cmp exit 0`, `rh status exit 0`, `pinned: v7.1.0-rc.2, 14 skills linked in: ...`, `pin check exit 0` |
| Manuscript run through the Skill tool | DONE: review agent ae6cdd9db984557c9, `ordo-high`, served `claude-opus-5-5`, 211130 tokens, 39 tool uses, 30.5 min |
| Grant run through the Skill tool | DONE: review agent ad72ce97d4f621a3b, `ordo-high`, served `claude-opus-5-5`, 134085 tokens, 6 tool uses, 10.3 min |
| Reports saved into `4-run/` | DONE: each equals the agent's `SubagentHandback` message apart from one letter written by its name (manuscript: `<latin small letter e with acute>`, grant: two `<en dash>`) |
| Four markers | DONE: a06df53aba5d3a063 (244143 tokens, 32 tool uses, 14.3 min), a1adeaa151d894670 (230831 tokens, 42 tool uses, 13.4 min), a0e8b92e8fd4f7258 (118985 tokens, 8 tool uses, 5.5 min), a17c2d12dd7e8cd3f (120846 tokens, 7 tool uses, 6.0 min), each `ordo-high`, served `claude-opus-5-5` |
| Every finding right by both | NOT DONE: 35 manuscript and 29 grant findings are not |
| Gate conditions 1 to 7 | NOT DONE: 1, 2, 3, 5 and 6 fail |
| Verify 1, the character-set check over `4-marks.md`, `4-report.md` and `4-run/*` | DONE: it prints nothing (`echo` of its exit printed `charset exit 0`) |
| Verify 2, the copies equal their sources after the marks | DONE: `diff exit 0`, `cmp exit 0` |
| Verify 3, research-hub status of the two source folders | DONE: `git -C /Users/axelfaes/workspace/research-hub status --short -- projects/manuscripts/hccnet-revision funding/2026-nwo-enw-xs` prints 0 lines |
| Verify 4, `git status --short` in `.agents/worktrees/3-the-writing-base-4` | NOT DONE as written: it prints `?? .scratch/3-the-writing-base/agents/briefs/4-round-1.md`, the round brief that `plan-orchestration` Steps 8 copies into the worktree's ledger, and nothing else (`echo` of its exit printed `wt status exit 0`) |

## The gate conditions

1. Places. Fails. The checks and their output stand under "Place checks". The manuscript: 228 checks, 227 print `1`. The four places the report gives by reference to another finding are checked with that finding's passage, and each prints `1`. The clause at report line 286, `sections/4_experiments/c_evaluation.tex:1`, "the remaining sentences as in findings 39 and 75", prints `0`, since finding 39's sentence stands at line 6. These 27 tense-list places, on report lines 264 to 301, give the file name without its path from the main file's folder: `a_data.tex:3`, `b_architecture.tex:14`, `b_architecture.tex:21`, `b_architecture.tex:26`, `b_architecture.tex:34`, `b_architecture.tex:39`, `b_architecture.tex:44`, `b_architecture.tex:5`, `b_implementation.tex:11`, `b_implementation.tex:3`, `b_implementation.tex:5`, `b_implementation.tex:7`, `b_implementation.tex:9`, `c_evaluation.tex:8`, `c_variants.tex:10`, `d_pretraining.tex:10`, `d_pretraining.tex:15`, `d_pretraining.tex:3`, `d_pretraining.tex:8`, `d_results.tex:11`, `d_results.tex:15`, `d_results.tex:19`, `d_results.tex:21`, `d_results.tex:25`, `d_results.tex:29`, `d_results.tex:5`, `d_results.tex:9`. The grant: 67 checks, 66 print `1`. Paragraph 35 split (b), report line 240, prints `0`, since its first sentence is finding 4's replacement.
2. Grouping. Fails. Both reports are grouped by page and section, the first group the one that most changes what the reader trusts, and every heading has one line. Lines that do not name a loss, by both markers: manuscript "Reader's question per section", "Most specific term" (its stated misreading is contradicted by tables/results_finetune.tex), the prose standard's section 0 for its six dash places, and grant "Hedging" and "ASCII throughout".
3. One fresh agent that edits no file. Holds for the grant: ad72ce97d4f621a3b, `ordo-high`, served `claude-opus-5-5`, tool uses `Read` 3, `Bash` 2, `SubagentHandback` 1. Its commands are the script's command and the same command piped through `LC_ALL=C grep -n '[^ -~]'`. Fails for the manuscript: ae6cdd9db984557c9, `ordo-high`, served `claude-opus-5-5`, tool uses `Read` 36, `Bash` 2, `SubagentHandback` 1, no `Edit`, `Write` or `NotebookEdit`. Its first command is the character-set grep over the 33 files. Its second runs `grep -n -o` for 'HCCNet-Pico', 'feature extractor', 'stem|patchify layer|first convolutional layer', AUC and model-size terms over the draft, a read-only command the skill's prompt does not allow ("The one command you run on a .tex ... draft is `LC_ALL=C grep -n '[^ -~]' <file>`"). One `Agent` call stands in each run's span.
4. The session wrote nothing and read no draft. Holds. Manuscript span (session transcript lines 37248 to 37337): `Bash` `grep -n -e '\\input{' -e '\\include{' 'main.tex'` and two loops of the same grep over the listed files, `Agent`, `Bash` `sleep 10; grep -o '"model":"[^"]*"' .../agent-ae6cdd9db984557c9.jsonl | sort -u`, then in the turn the manuscript notice started `Skill` (grant), `Bash` `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "effort exit $?"`, `Agent`, `Bash` model check of ad72ce97d4f621a3b, and `Read` twice of the persisted tool result holding the manuscript report. Grant span (to line 37400): the same after its `Skill` call, then a context compaction and one `Bash` `grep -n -i -E 'Decision|next message|one message|nothing else|whole' .../briefs/4.md | head -40`. No `Write`, `Edit` or `NotebookEdit`, and no read of a draft file. The text that ends each turn equals the review agent's `SubagentHandback` message (a comparison of the two strings printed `True` for both). The pin before the first run: `pinned: v7.1.0-rc.2, 14 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills`, `pin check exit 0`. Each `Skill` result names `Base directory for this skill: /Users/axelfaes/.claude-backup/skills/writing`. The two served-model reads of the review agents (transcript lines 37281 and 37317) each start with `sleep 10`. The change standard's "no background shells, sleeping or polling" does not allow that, and it is a departure of this step. Step 6's Step 0 in `plan.md` asks for the read with no sleep.
5. Passage and replacement as text. Fails for the manuscript: finding 83 quotes no passage (both markers). Manuscript marker 1 reads the replacements of findings 5, 64 (first break), 66, 67, 68, 69, 71, 82 (first break) and 83 as descriptions of the edit, which marker 2 counts as text. The grant: holds by both markers.
6. Two marks each. Fails. Every finding has two marks from two distinct agents, none a review agent, each `ordo-high` served `claude-opus-5-5`, but not every finding is right by both (`4-marks.md`). It also fails on manuscript marker 1's reading: its `Read` calls cover 17 of the 33 draft files, and it read the other 16 with `cat -n` in `Bash`. Marker tool uses: a06df53aba5d3a063 `Read` 24, `Bash` 7, a1adeaa151d894670 `Read` 40, `Bash` 1, a0e8b92e8fd4f7258 `Read` 5, `Bash` 2, a17c2d12dd7e8cd3f `Read` 5, `Bash` 1, each `SubagentHandback` 1, none `Edit`, `Write`, `NotebookEdit`, `Agent` or `Skill`. The grant markers' prompts hold the report equal to the review agent's message (a comparison printed `equal: True 40787 40787` for each). The manuscript markers' prompts give the saved report's path (Open item G). No marker was given another's marks. Step 6's Step 0 in `plan.md` asks each marker's prompt to say that the draft files are read with the file-reading tool only.
7. The copies equal their sources after the marks. Holds: `diff -r exit 0`, `cmp exit 0`, and research-hub `git status --short` prints 0 lines.
8. What the marks do not check: they judge the findings the reports give, and no check counts breaks a report missed, since the gate asks for none.

## Place checks

Each manuscript check runs from the main file's folder of the copy, `<scratchpad>/3-2-run/manuscript`. Each grant check runs `python3 -I <docx_paragraphs.py> <copy>`, where `<docx_paragraphs.py>` is `/Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py` and `<copy>` is `<scratchpad>/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx`. Each entry gives the report line and the place, the command, and its output. A place the report gives by reference to another finding is checked with that finding's passage. The one en dash in a quoted part (paragraph 64) is written `<en dash>` here, and the command that ran holds the character.

### Manuscript report

```
report line 6, sections/4_experiments/d_results.tex:11
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'This corresponds with the results presented in Tab'
1
report line 11, sections/4_experiments/b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'Owing to the limited number of positive cases and'
1
report line 15, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'An ablation that pre-trains only the CNN backbone'
1
report line 19, sections/6_conclusion/conclusion.tex:1
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Beyond the original framework, an ablation of the'
1
report line 23, sections/1_introduction/introduction.tex:11
$ sed -n '11p' sections/1_introduction/introduction.tex | grep -cF -- 'Additionally, the Transformer encoder is pre-train'
1
report line 30, sections/abstract/abstract.tex:3
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'We demonstrate the effectiveness of HCCNet by appl'
1
report line 34, sections/abstract/abstract.tex:3
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'Our results show that HCCNet substantially improve'
1
report line 38, sections/abstract/abstract.tex:5
$ sed -n '5p' sections/abstract/abstract.tex | grep -cF -- 'The methodological approach presented in this pape'
1
report line 42, sections/abstract/abstract.tex:5
$ sed -n '5p' sections/abstract/abstract.tex | grep -cF -- 'Its ability to handle varying patient record lengt'
1
report line 47, sections/1_introduction/introduction.tex:9
$ sed -n '9p' sections/1_introduction/introduction.tex | grep -cF -- 'Unlike previous approaches that rely on 2D slices'
1
report line 52, sections/1_introduction/introduction.tex:13
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'By fine-tuning the pre-trained model on this datas'
1
report line 56, sections/1_introduction/introduction.tex:13
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'Thus, HCCNet provides a flexible framework that ca'
1
report line 61, sections/5_discussion/discussion.tex:10
$ sed -n '10p' sections/5_discussion/discussion.tex | grep -cF -- 'Inspection of the models'"'"' reliability diagrams fur'
1
report line 65, sections/5_discussion/discussion.tex:10
$ sed -n '10p' sections/5_discussion/discussion.tex | grep -cF -- 'Thus, even for imaging modalities where the pre-tr'
1
report line 69, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'We attribute this to the limited number of positiv'
1
report line 74, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'Contrarily, for the fine-tuned models, preceding p'
1
report line 78, sections/6_conclusion/conclusion.tex:1
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'The methodology is versatile and offers a framewor'
1
report line 85, sections/2_related_work/a_longitudinal_analysis.tex:1
$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'To date, deep learning applications to medical ima'
1
report line 89, sections/2_related_work/a_longitudinal_analysis.tex:1
$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'As a result, longitudinal imaging has long been es'
1
report line 94, sections/2_related_work/a_longitudinal_analysis.tex:5
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'To mitigate this shortcoming, our study uses a hyb'
1
report line 98, sections/2_related_work/b_pretraining.tex:1
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'While the temporal relationship across medical ima'
1
report line 102, sections/2_related_work/b_pretraining.tex:1
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Using the potential abundance of unlabeled data, s'
1
report line 107, sections/2_related_work/b_pretraining.tex:3
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Among them, contrastive learning approaches remain'
1
report line 111, sections/3_methodology/d_pretraining.tex:1
$ sed -n '1p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'When training neural networks, task agnostic pre-t'
1
report line 115, sections/1_introduction/introduction.tex:7
$ sed -n '7p' sections/1_introduction/introduction.tex | grep -cF -- 'Likewise, most deep learning applications are aime'
1
report line 119, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'Our augmentation strategy exposes the backbone to'
1
report line 127, sections/5_discussion/discussion.tex:8
$ sed -n '8p' sections/5_discussion/discussion.tex | grep -cF -- 'while combined T1 in- and out-of-phase and T2-weig'
1
report line 131, sections/5_discussion/discussion.tex:8
$ sed -n '8p' sections/5_discussion/discussion.tex | grep -cF -- 'Our proposed pre-training approach improved model'
1
report line 135, sections/3_methodology/e_finetuning.tex:1
$ sed -n '1p' sections/3_methodology/e_finetuning.tex | grep -cF -- 'Additionally, we append the final pooling layer as'
1
report line 142, sections/4_experiments/a_data.tex:1
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'We evaluate HCCNet on data that is retrospectively'
1
report line 146, sections/5_discussion/discussion.tex:6
$ sed -n '6p' sections/5_discussion/discussion.tex | grep -cF -- 'To support HCCNet'"'"'s capability to capture disease'
1
report line 150, sections/5_discussion/discussion.tex:16
$ sed -n '16p' sections/5_discussion/discussion.tex | grep -cF -- 'Despite these successes, several challenges and li'
1
report line 157, main.tex:45
$ sed -n '45p' main.tex | grep -cF -- '\title{HCCNet: A Self-Supervised CNN-Transformer f'
1
report line 161, sections/abstract/abstract.tex:1
$ sed -n '1p' sections/abstract/abstract.tex | grep -cF -- 'To address this, we propose HCCNet, a novel model'
1
report line 166, sections/1_introduction/introduction.tex:11
$ sed -n '11p' sections/1_introduction/introduction.tex | grep -cF -- 'The CNN backbone is pre-trained using an extended'
1
report line 170, sections/3_methodology/b_architecture.tex:14
$ sed -n '14p' sections/3_methodology/b_architecture.tex | grep -cF -- 'The Transformer encoder is based on the Pre-LN imp'
1
report line 174, sections/3_methodology/b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'patchify layer'
1
report line 174, sections/3_methodology/b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'Additionally, we reimplement the patchify layer in'
1
report line 179, sections/appendix/b_additional_results/1_baseline.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'Overall differences between imaging modalities are'
1
report line 184, sections/4_experiments/c_evaluation.tex:6
$ sed -n '6p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Likewise, for the comparison against the randomly'
1
report line 192, sections/3_methodology/c_variants.tex:1
$ sed -n '1p' sections/3_methodology/c_variants.tex | grep -cF -- 'In addition to our base model, called HCCNet-Pico,'
1
report line 193, sections/3_methodology/c_variants.tex:10
$ sed -n '10p' sections/3_methodology/c_variants.tex | grep -cF -- 'scales only the channel and hidden dimensions of H'
1
report line 194, sections/4_experiments/b_implementation.tex:9, the passage of finding 2
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'Owing to the limited number of positive cases and'
1
report line 195, sections/4_experiments/b_implementation.tex:11
$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We conduct this ablation on the HCCNet-Pico varian'
1
report line 196, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'At HCCNet-Pico, the standalone T2-MRI model (AUPRC'
1
report line 197, sections/4_experiments/d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'reports the fine-tuned HCCNet-Pico performance'
1
report line 198, sections/4_experiments/d_results.tex:29
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'the contribution of the two pre-training stages fo'
1
report line 199, tables/results_fusion.tex:3
$ sed -n '3p' tables/results_fusion.tex | grep -cF -- '(HCCNet-Pico)}'
1
report line 200, tables/results_fusion.tex:21
$ sed -n '21p' tables/results_fusion.tex | grep -cF -- 'All configurations use the HCCNet-Pico variant'
1
report line 201, tables/results_pretrain_ablation.tex:3
$ sed -n '3p' tables/results_pretrain_ablation.tex | grep -cF -- '(HCCNet-Pico)}'
1
report line 202, tables/results_pretrain_ablation.tex:27
$ sed -n '27p' tables/results_pretrain_ablation.tex | grep -cF -- 'All configurations use the HCCNet-Pico variant.'
1
report line 205, sections/3_methodology/b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- '\textbf{CNN Feature Extractor.}'
1
report line 206, sections/3_methodology/b_architecture.tex:7
$ sed -n '7p' sections/3_methodology/b_architecture.tex | grep -cF -- 'The CNN feature extractor takes the MR images as i'
1
report line 207, sections/3_methodology/b_architecture.tex:14
$ sed -n '14p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we concatenate the image embeddings obtained from'
1
report line 208, sections/3_methodology/d_pretraining.tex:3
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- '\textbf{CNN Feature Extractor.}'
1
report line 209, sections/3_methodology/d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we keep the parameters of the CNN feature extracto'
1
report line 210, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'During pre-training of the CNN feature extractor,'
1
report line 211, tables/results_pretrain_ablation.tex:27
$ sed -n '27p' tables/results_pretrain_ablation.tex | grep -cF -- 'pre-trains the CNN feature extractor using DINO'
1
report line 214, sections/3_methodology/d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Since the backbone is pre-trained on single-channe'
1
report line 215, sections/3_methodology/d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This transfers the pre-trained representation to i'
1
report line 218, sections/2_related_work/a_longitudinal_analysis.tex:5
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'area under the receiver operating characteristic c'
1
report line 223, sections/abstract/abstract.tex:1
$ sed -n '1p' sections/abstract/abstract.tex | grep -cF -- 'To address this, we propose HCCNet,'
1
report line 224, sections/3_methodology/d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This teaches the model to identify the same patien'
1
report line 225, sections/3_methodology/d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This transfers'
1
report line 226, sections/4_experiments/d_results.tex:11
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'This corresponds with'
1
report line 227, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'We attribute this to'
1
report line 228, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'That is despite that baseline models trained using'
1
report line 229, sections/appendix/a_implementation/3_hyperparams.tex:3
$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'This is due to convergence issues that we noted du'
1
report line 234, sections/1_introduction/introduction.tex:1
$ sed -n '1p' sections/1_introduction/introduction.tex | grep -cF -- 'Predicting disease outcomes based on longitudinal'
1
report line 239, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'Table \ref{tab:finetuned_results} presents fine-tu'
1
report line 246, sections/1_introduction/introduction.tex:1
$ sed -n '1p' sections/1_introduction/introduction.tex | grep -cF -- 'remains a significant challenge \citep{jin2021pred'
1
report line 247, sections/1_introduction/introduction.tex:5
$ sed -n '5p' sections/1_introduction/introduction.tex | grep -cF -- 'Traditional approaches often simplify this task'
1
report line 248, sections/1_introduction/introduction.tex:5
$ sed -n '5p' sections/1_introduction/introduction.tex | grep -cF -- 'However, this method has limitations, particularly'
1
report line 249, sections/1_introduction/introduction.tex:7
$ sed -n '7p' sections/1_introduction/introduction.tex | grep -cF -- 'However, many existing approaches have not fully e'
1
report line 250, sections/2_related_work/a_longitudinal_analysis.tex:5
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Hybrid models can be trained end-to-end, consecuti'
1
report line 251, sections/2_related_work/a_longitudinal_analysis.tex:7
$ sed -n '7p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Likewise, many of them disregard'
1
report line 252, sections/2_related_work/b_pretraining.tex:1
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'As a result, many deep learning studies analyzing'
1
report line 253, sections/3_methodology/a_problem_formulation.tex:1
$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 'Since the frequency of liver screenings is typical'
1
report line 254, figures/cumulative_gain.tex:10
$ sed -n '10p' figures/cumulative_gain.tex | grep -cF -- 'Generally, lower MAE values indicate greater robus'
1
report line 255, sections/5_discussion/discussion.tex:6
$ sed -n '6p' sections/5_discussion/discussion.tex | grep -cF -- 'Despite being long established as the gold standar'
1
report line 262, sections/3_methodology/a_problem_formulation.tex:1
$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 'This study aims to define'
1
report line 262, sections/3_methodology/a_problem_formulation.tex:1
$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 'patient records are subset during fine-tuning'
1
report line 262, sections/3_methodology/a_problem_formulation.tex:1
$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- '\subseteq D^{(p,t)}$ is set to:'
1
report line 263, sections/3_methodology/b_architecture.tex:3
$ sed -n '3p' sections/3_methodology/b_architecture.tex | grep -cF -- 'We use the CNN backbone'
1
report line 264, b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we adapt the ConvNeXt architecture'
1
report line 264, b_architecture.tex:5
$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we replace the 2-dimensional depthwise convolution'
1
report line 265, b_architecture.tex:14, the passage of finding 41
$ sed -n '14p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we concatenate the image embeddings'
1
report line 266, b_architecture.tex:21
$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we embed the input'"'"'s positional information'
1
report line 266, b_architecture.tex:21
$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we replace the conventional sequence position'
1
report line 266, b_architecture.tex:21
$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'The reference point is determined solely'
1
report line 266, b_architecture.tex:21
$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'and never uses the outcome itself'
1
report line 266, b_architecture.tex:21
$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we compute the vector of intervals'
1
report line 267, b_architecture.tex:26
$ sed -n '26p' sections/3_methodology/b_architecture.tex | grep -cF -- 'obtain positional encodings'
1
report line 267, b_architecture.tex:26
$ sed -n '26p' sections/3_methodology/b_architecture.tex | grep -cF -- 'prepend'
1
report line 268, b_architecture.tex:34
$ sed -n '34p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we add the positional encodings'
1
report line 269, b_architecture.tex:39
$ sed -n '39p' sections/3_methodology/b_architecture.tex | grep -cF -- 'We feed the input sequence through the encoder $G$'
1
report line 270, b_architecture.tex:44
$ sed -n '44p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we feed it through a pooling layer'
1
report line 271, sections/3_methodology/c_variants.tex:1, the passage of finding 40
$ sed -n '1p' sections/3_methodology/c_variants.tex | grep -cF -- 'In addition to our base model, called HC'
1
report line 271, c_variants.tex:10
$ sed -n '10p' sections/3_methodology/c_variants.tex | grep -cF -- 'we additionally introduce HCCNet-C (compact)'
1
report line 272, sections/3_methodology/d_pretraining.tex:1
$ sed -n '1p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we therefore design two'
1
report line 273, d_pretraining.tex:3
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'this study extends the self-supervised DINO pre-tr'
1
report line 273, d_pretraining.tex:3
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we define a student'
1
report line 273, d_pretraining.tex:3
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'the teacher is built as'
1
report line 273, d_pretraining.tex:3
$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we learn to match'
1
report line 274, d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we exploit the abundance'
1
report line 274, d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we treat different series'
1
report line 275, d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'this study employs a simple binary sequence-order-'
1
report line 275, d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we randomly shuffle 50\% of the input sequences'
1
report line 275, d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'and task the model'
1
report line 275, d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we actually randomly shuffle 66\% of sequences'
1
report line 275, d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'We apply the sigmoid function'
1
report line 275, d_pretraining.tex:10
$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'and learn to identify shuffled sequences'
1
report line 276, d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we do not randomly crop multiple views from the sa'
1
report line 276, d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we concatenate the different series'
1
report line 277, sections/3_methodology/e_finetuning.tex:1
$ sed -n '1p' sections/3_methodology/e_finetuning.tex | grep -cF -- 'we initialize the parameters of HCCNet'
1
report line 278, sections/4_experiments/a_data.tex:1
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'This complete co-availability allows us'
1
report line 279, a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'we include all available data in superset $D_p$ du'
1
report line 279, a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'We partition the patient cohort'
1
report line 279, a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'The folds are stratified by HCC outcome so that th'
1
report line 279, a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'Because pre-training is re-run within every fold,'
1
report line 279, a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'we only fine-tune HCCNet on longitudinal MRIs that'
1
report line 280, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we pre-train both the CNN backbone'
1
report line 280, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We train the CNN over 32000 training steps'
1
report line 280, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we decay the learning rate'
1
report line 280, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We employ the same cosine decay without warm-up fo'
1
report line 280, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we also limit the temperature'
1
report line 280, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'and increase the initial exponential moving averag'
1
report line 281, b_implementation.tex:3
$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'While MRI scans are assumed to be i.i.d. during CN'
1
report line 281, b_implementation.tex:3
$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we train the Transformer encoder'
1
report line 281, b_implementation.tex:3
$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We set the maximal sequence length to $s = 8$, app'
1
report line 282, b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we update HCCNet'
1
report line 282, b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We fine-tune the model over 400 training steps'
1
report line 282, b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'but decrease the weight decay'
1
report line 282, b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we select the batch size'
1
report line 282, b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'and apply no further hyperparameter tuning'
1
report line 282, b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we then train HCCNet'
1
report line 282, b_implementation.tex:5
$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'and evaluate it on the corresponding held-out fold'
1
report line 283, b_implementation.tex:7
$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we establish a baseline'
1
report line 283, b_implementation.tex:7
$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we equally train the baseline'
1
report line 283, b_implementation.tex:7
$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We employ the same optimizer'
1
report line 283, b_implementation.tex:7
$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'but slightly increase the learning rate warm-up'
1
report line 284, b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we additionally evaluate a set of exploratory mult'
1
report line 284, b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we naively concatenate'
1
report line 284, b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'Concretely, we evaluate the full fusion'
1
report line 284, b_implementation.tex:9
$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'augmentation views are sampled within a single con'
1
report line 285, b_implementation.tex:11
$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we further disentangle'
1
report line 285, b_implementation.tex:11
$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we evaluate two intermediate configurations'
1
report line 286, sections/4_experiments/c_evaluation.tex:1
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we evaluate HCCNet'"'"'s baseline'
1
report line 286, sections/4_experiments/c_evaluation.tex:1
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we train ten independently seeded models (fifty mo'
1
report line 286, sections/4_experiments/c_evaluation.tex:1
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we also explore the robustness of the model'
1
report line 287, c_evaluation.tex:8, the passage of finding 81
$ sed -n '8p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Since all metrics are obtained through c'
1
report line 288, sections/appendix/a_implementation/1_conv_layer.tex:3
$ sed -n '3p' sections/appendix/a_implementation/1_conv_layer.tex | grep -cF -- 'we inflate the 2D depthwise and pointwise convolut'
1
report line 289, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we randomly crop a multi-channel sub-volume'
1
report line 289, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'further augmentations remain consistent'
1
report line 289, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we randomly shift and scale the intensity'
1
report line 289, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'apply random 90 degree rotations'
1
report line 289, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'and randomly flip the cropped view'
1
report line 289, sections/appendix/a_implementation/2_augmentations.tex:1
$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we use the same data augmentation strategy'
1
report line 290, sections/appendix/a_implementation/3_hyperparams.tex:3
$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'we slightly deviate from'
1
report line 293, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'HCCNet trained using diffusion weighted MR images'
1
report line 294, d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'The combined T1 IOP \& T2-MRI modality reaches AUP'
1
report line 294, d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'the combined modality nonetheless remains the weak'
1
report line 295, d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'we explore the impact of varying model complexity'
1
report line 295, d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'the per-fold ensemble closely follows the diagonal'
1
report line 295, d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'This robustness is tightest on AUROC'
1
report line 295, d_results.tex:9
$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'No model variant falls consistently below the diag'
1
report line 296, d_results.tex:11
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'the models are thus robust'
1
report line 296, d_results.tex:11
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'the plots reveal no consistent differences across'
1
report line 297, d_results.tex:15
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'the magnitude of the improvement from our proposed'
1
report line 298, d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'we compare the reliability'
1
report line 298, d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'the expected calibration error does not display'
1
report line 298, d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'consistently show the lowest expected calibration'
1
report line 299, d_results.tex:21
$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'This reduction is largest for diffusion weighted M'
1
report line 299, d_results.tex:21
$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'and is smallest at 12.1\%'
1
report line 300, d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'we evaluate whether naively fusing'
1
report line 300, d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'None of the fused configurations exceeds'
1
report line 300, d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'As all differences fall within one standard deviat'
1
report line 301, d_results.tex:29
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'The CNN-backbone dominance also holds'
1
report line 301, d_results.tex:29
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'clearly exceeds the Transformer encoder alone'
1
report line 301, d_results.tex:29
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'the two stages contribute comparably'
1
report line 302, sections/appendix/b_additional_results/1_baseline.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'consistently display the highest detection rate'
1
report line 303, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'variations in reliability scores are predominantly'
1
report line 303, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'consistently display the lowest average reliabilit'
1
report line 303, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'display the lowest average reliability scores, whi'
1
report line 308, sections/abstract/abstract.tex:3
$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'The CNN backbone is pre-trained using a self-super'
1
report line 315, sections/1_introduction/introduction.tex:13
$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'This application not only demonstrates HCCNet'"'"'s ca'
1
report line 324, sections/2_related_work/a_longitudinal_analysis.tex:3
$ sed -n '3p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'While the approach is relatively simple to impleme'
1
report line 332, sections/2_related_work/a_longitudinal_analysis.tex:5
$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Hybrid models can be trained end-to-end, consecuti'
1
report line 336, sections/2_related_work/b_pretraining.tex:3
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'As such, they randomly derive different views from'
1
report line 340, sections/5_discussion/discussion.tex:12
$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'Finally, our exploratory multi-modal experiments s'
1
report line 344, sections/5_discussion/discussion.tex:18
$ sed -n '18p' sections/5_discussion/discussion.tex | grep -cF -- 'Incorporating these data sources could further enh'
1
report line 348, sections/3_methodology/d_pretraining.tex:8
$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Note that in our implementation, we use a 3D crop'
1
report line 360, sections/3_methodology/d_pretraining.tex:15
$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Provided a sequence of DW-MRI'"'"'s with diffusion coe'
1
report line 364, sections/4_experiments/a_data.tex:1
$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'Prior to pre-training and fine-tuning, MR images w'
1
report line 371, sections/4_experiments/a_data.tex:3
$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'During fine-tuning we additionally exclude all pat'
1
report line 384, sections/4_experiments/b_implementation.tex:1
$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'During the first 5\% of training steps (i.e., 1600'
1
report line 391, sections/4_experiments/c_evaluation.tex:1
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Every reported metric is computed on this per-fold'
1
report line 398, sections/4_experiments/d_results.tex:5
$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'Contrast enhanced T1 weighted and the combination'
1
report line 406, sections/4_experiments/d_results.tex:15
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'That is, although baseline model results vary only'
1
report line 410, sections/4_experiments/d_results.tex:19
$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'Extended reliability metrics are presented in Tabl'
1
report line 417, sections/6_conclusion/conclusion.tex:1
$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Exploratory experiments further showed that naivel'
1
report line 427, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'That is despite'
1
report line 427, sections/appendix/b_additional_results/2_reliability.tex:3
$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- Contrarily
1
report line 434, sections/4_experiments/d_results.tex:25
$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'Adding T1 DCE-MRI to DW-MRI lowers performance (AU'
1
report line 438, sections/4_experiments/d_results.tex:29
$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'For diffusion-weighted imaging, pre-training only'
1
report line 442, sections/4_experiments/c_evaluation.tex:8
$ sed -n '8p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Since all metrics are obtained through cross-valid'
1
report line 446, sections/2_related_work/b_pretraining.tex:1
$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'However, the usefulness of transfer learning from'
1
report line 454, sections/4_experiments/d_results.tex:21
$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'More interestingly, the comparison between baselin'
1
report line 460, main.tex:47
$ sed -n '47p' main.tex | grep -cF -- 'Longitudinal 3D MRI Images: -- A Case Study on Hep'
1
report line 461, main.tex:49
$ sed -n '49p' main.tex | grep -cF -- 'Longitudinal 3D MRI Images -- A Case Study on Hepa'
1
report line 462, main.tex:51
$ sed -n '51p' main.tex | grep -cF -- 'Longitudinal 3D MRI Images -- A Case Study on Hepa'
1
report line 463, main.tex:53
$ sed -n '53p' main.tex | grep -cF -- 'Longitudinal 3D MRI Images -- A Case Study on Hepa'
1
report line 464, main.tex:57
$ sed -n '57p' main.tex | grep -cF -- 'Longitudinal Medical Images -- Application to Hepa'
1
report line 465, sections/5_discussion/discussion.tex:1
$ sed -n '1p' sections/5_discussion/discussion.tex | grep -cF -- 'HCCNet - a spatio-temporal neural network that uti'
1
report line 470, sections/4_experiments/d_results.tex:15
$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'Finally, we evaluate the impact of our proposed pr'
1
report line 477, sections/4_experiments/d_results.tex:3
$ sed -n '3p' sections/4_experiments/d_results.tex | grep -cF -- 'We report HCCNet'"'"'s fine-tuned performance (i) acro'
1
report line 481, sections/4_experiments/d_results.tex:11
$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'At least on the data evaluated in this study, vari'
1
report line 488, sections/1_introduction/introduction.tex:9
$ sed -n '9p' sections/1_introduction/introduction.tex | grep -cF -- 'HCCNet integrates a 3D adaptation of the ConvNeXt'
1
report line 492, sections/1_introduction/introduction.tex:11
$ sed -n '11p' sections/1_introduction/introduction.tex | grep -cF -- 'This self-supervised learning approach allows the'
1
report line 500, sections/2_related_work/b_pretraining.tex:3
$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Instead of simply comparing view pairs from differ'
1
report line 501, sections/2_related_work/b_pretraining.tex:5
$ sed -n '5p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'adopts a simple sequence-order-prediction task'
1
report line 507, sections/6_conclusion/ack.tex:2-3
$ sed -n '2,3p' sections/6_conclusion/ack.tex | tr '\n' ' ' | grep -cF -- MRI-radiomics
1
report line 507, sections/6_conclusion/ack.tex:2-3
$ sed -n '2,3p' sections/6_conclusion/ack.tex | tr '\n' ' ' | grep -cF -- 'Primair leverkanker'
1
report line 511, sections/6_conclusion/ack.tex:6-8
$ sed -n '6,8p' sections/6_conclusion/ack.tex | tr '\n' ' ' | grep -cF -- '(OpenAI ChatGPT) to help'
1
report line 511, sections/6_conclusion/ack.tex:6-8
$ sed -n '6,8p' sections/6_conclusion/ack.tex | tr '\n' ' ' | grep -cF -- 'refine the English language'
1
report line 511, sections/6_conclusion/ack.tex:6-8
$ sed -n '6,8p' sections/6_conclusion/ack.tex | tr '\n' ' ' | grep -cF -- 'reviewed and edited the'
1
report line 511, sections/6_conclusion/ack.tex:6-8
$ sed -n '6,8p' sections/6_conclusion/ack.tex | tr '\n' ' ' | grep -cF -- 'content as needed'
1
report line 286, sections/4_experiments/c_evaluation.tex:1, the clause "the remaining sentences as in findings 39"
$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Likewise, for the comparison against the randomly'
0
```

### Grant report

```
report line 9, paragraph 19
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^19: ' | grep -cF -- 'Postdoc (applicant), 0,42 FTE, 12 months, UNL CAO'
1
report line 14, paragraph 25
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^25: ' | grep -cF -- 'Open-access charges and costs of the openly releas'
1
report line 19, paragraph 31
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'The budget requests 0,42 FTE of the applicant'"'"'s ow'
1
report line 24, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'The tested study is the latest usable study at lea'
1
report line 29, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'Whether it reflects a diffuse malignant field or a'
1
report line 34, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'The livers of all patients are then aligned to one'
1
report line 42, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'The project fits the XS scheme as a pre-registered'
1
report line 47, paragraph 40
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The studies hold several MRI scan types (sequences'
1
report line 52, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'Components are checked against estimates of liver'
1
report line 57, paragraph 45
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^45: ' | grep -cF -- 'The lower panel sketches a divergence score rising'
1
report line 67, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'Within the liver outline from the organ map, the s'
1
report line 72, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'Before the pre-registration is deposited, a data s'
1
report line 77, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'Success means reproducible components that track t'
1
report line 85, paragraph 48
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- 'Imaging of the background liver already estimates'
1
report line 88, paragraph 48
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- 'What is new here is the within-patient, point-by-p'
1
report line 95, paragraph 48
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- 'If the hypothesis holds, surveillance can warn wit'
1
report line 103, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The analysis code, number of components and matchi'
1
report line 111, paragraph 8
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^8: ' | grep -cF -- 'Liver cancer usually grows in a scarred, cirrhotic'
1
report line 116, paragraph 11
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^11: ' | grep -cF -- 'Leverkanker ontstaat meestal in een verlittekende,'
1
report line 121, paragraph 34
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Hepatocellular carcinoma (HCC) mostly arises in a'
1
report line 126, paragraph 34
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'In practice, surveillance detects a tumour only on'
1
report line 131, paragraph 34
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises the tumour ['
1
report line 139, paragraph 34
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Molecular studies have shown that prognostic signa'
1
report line 144, paragraph 48
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- 'Molecular pathology places prognostic signal in th'
1
report line 154, paragraph 40
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The cohort holds 243 patients with outcome labels'
1
report line 159, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'We align each study to the patient'"'"'s earlier studi'
1
report line 164, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The data steward keeps the outcome labels, gives t'
1
report line 172, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'A radiologist blinded to outcome re-reads the test'
1
report line 177, paragraph 34
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'The opportunity is a surveillance cohort of 243 pa'
1
report line 187, paragraph 8
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^8: ' | grep -cF -- 'Cancer is thought to arise from gradual change acr'
1
report line 194, paragraph 11
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^11: ' | grep -cF -- 'Kanker ontstaat vermoedelijk uit een geleidelijke'
1
report line 201, paragraph 31
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'deliver the pre-registered primary endpoint and re'
1
report line 206, paragraph 31
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'The applicant'"'"'s standing appointment covers the re'
1
report line 211, paragraph 31
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'Computing is provided by the host institution at n'
1
report line 216, paragraph 31
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'Dissemination covers open-access publication charg'
1
report line 223, paragraph 34
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'In practice, surveillance detects a tumour only on'
1
report line 228, paragraph 34
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises the tumour ['
1
report line 235, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'before diagnosis. The tested study is the latest u'
1
report line 240, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'A matched position has the same scan year and numb'
0
report line 245, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'A within-patient analysis adjusted for decompensat'
1
report line 245, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'gives supporting evidence. The claim is predictive'
1
report line 250, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'Molecular confirmation lies outside this project.'
1
report line 255, paragraph 35
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'If it does, surveillance can warn within the curat'
1
report line 262, paragraph 40
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The clinical record gives the date of HCC diagnosi'
1
report line 267, paragraph 40
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The analysis uses the sequences taken without cont'
1
report line 274, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'and the liver segments used in C3 and WP1 are the'
1
report line 279, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'The analyst receives only studies taken before dia'
1
report line 284, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'Components are checked against estimates of liver'
1
report line 284, paragraph 41
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'and against decompensation status. Before the pre-'
1
report line 291, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'expressed as a standard deviation. The tested stud'
1
report line 296, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'Tested studies at level 2 are excluded (none of th'
1
report line 301, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'A sensitivity analysis restricted to tested studie'
1
report line 301, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The primary test is repeated in the 5 patients'
1
report line 306, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'and reassigning diagnosis dates at random between'
1
report line 311, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The analysis code, number of components and matchi'
1
report line 321, paragraph 46
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^46: ' | grep -cF -- 'Overlapping work packages: WP1 (mo 1-4) aligns the'
1
report line 321, paragraph 46
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^46: ' | grep -cF -- 'obtains the detection limit from inserted changes'
1
report line 331, paragraph 47
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^47: ' | grep -cF -- 'Risks and mitigation. (i) Signal too small above c'
1
report line 331, paragraph 47
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^47: ' | grep -cF -- '(iii) Scanner drift'
1
report line 331, paragraph 47
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^47: ' | grep -cF -- '(iv) Missed tumour, alignment error or selection b'
1
report line 331, paragraph 47
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^47: ' | grep -cF -- 'with the excluded studies described to show whethe'
1
report line 344, paragraph 43
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^43: ' | grep -cF -- 'The liver segment where the tumour later appears i'
1
report line 354, paragraph 42
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'Success means a one-sided test at alpha 0.05 showi'
1
report line 359, paragraph 43
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^43: ' | grep -cF -- 'Success means the future tumour segment ranks abov'
1
report line 369, paragraph 31
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'The applicant'"'"'s standing appointment covers the re'
1
report line 374, paragraph 46
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^46: ' | grep -cF -- 'The applicant works at 0,42 FTE across all twelve'
1
report line 384, paragraph 64
$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^64: ' | grep -cF -- 'Application Form <en dash> NWO Open Competition Domain Sci'
1
```

## Files

```
     384 .scratch/3-the-writing-base/agents/reviews/4-marks.md
    1001 .scratch/3-the-writing-base/agents/reviews/4-report.md
     116 .scratch/3-the-writing-base/agents/reviews/4-run/grant-marks-1.md
     128 .scratch/3-the-writing-base/agents/reviews/4-run/grant-marks-2.md
     386 .scratch/3-the-writing-base/agents/reviews/4-run/grant-report.md
     333 .scratch/3-the-writing-base/agents/reviews/4-run/manuscript-marks-1.md
     227 .scratch/3-the-writing-base/agents/reviews/4-run/manuscript-marks-2.md
     515 .scratch/3-the-writing-base/agents/reviews/4-run/manuscript-report.md
     180 .scratch/3-the-writing-base/plan.md
     110 .scratch/3-the-writing-base/orchestrator-state.md
     374 .scratch/choices.md
```

## Scratch files written outside "Paths this step writes"

The brief allows the copies under `<scratchpad>/3-2-run/` outside the repository. The step also wrote these files in `<scratchpad>`, none of which is read by a later step:

- the run and the marks: `extract_handback.py` (saves an agent's hand-back message), `cmp_prompt.py` (compares a marker's prompt with the report), `manuscript-marks-1.body`, `manuscript-marks-2.body`, `grant-marks-1.body` and `grant-marks-2.body` (the markers' messages before their header lines), `c1-manuscript.cmds` and `c1-manuscript.out` (the first place checks), `grant-paragraphs.txt` (the copy's numbered paragraphs).
- repair round 1: `place-cmds-manuscript.txt`, `place-cmds-grant.txt`, `place-out-manuscript.txt` and `place-out-grant.txt` (the place checks), `run_places.py` (runs them), `places-manuscript.txt` and `places-grant.txt` (their output as quoted above), `nopath.txt` (the 27 places without a folder path), `marks-rows-manuscript.md`, `marks-head.md` and `marks-mid.md` (the parts of `4-marks.md`), and `report-a.md` (this report before its lists were filled in).

## Judgment calls the brief left open

- The manuscript markers read the report by path (Open item G, C70).
- Three marker starts were stopped before they marked anything, and none of their output is used. The first two prompts (a16a29426ffdd26f3, 5226 characters, and a620ea19667843403, 5016 characters) carried the placeholders "FILE_PLACEHOLDER" and "REPORT_TEXT" where the report should stand, and neither agent made a tool call. The third prompt (a07ee5da81e8d1b27) stopped at 32354 characters when a safety classifier stopped the session's response: the session transcript's turn that holds that `Agent` call ends with `"stop_reason":"refusal"`. That agent made two `Read` calls before it was stopped. The grant markers' prompts, 44152 characters each, went through. Each was `ordo-high`.
- A finding with several places is marked per place, and `4-marks.md` gives a row per place.

## User-visible changes

None: the step changes no file outside the ledger.

## Wrong or impossible in the brief

- "The marks", first bullet: the manuscript report, 76936 characters, was not written into a marker's prompt. The one start whose prompt held the report text (a07ee5da81e8d1b27) was stopped by a safety classifier at 32354 characters, and the runner's notice that followed (session transcript line 37523) said "Do not produce that content again, even reworded", which barred a second attempt. What the classifier objected to is not known: the grant prompts of 44152 characters went through, so length alone does not explain it. Open item G gives the path instead.

## Repair round 1

| Ruling | What changed |
|---|---|
| 1, Spec 1 | No change, as the ruling says. |
| 2, Spec 2 | "Place checks" quotes 228 manuscript and 67 grant checks with their output, the tense clauses, the further places on a line and `c_variants.tex:10` included. Gate condition 1 and C1 are read from that list. "Scratch files written outside" names the scratch files. |
| 3, Spec 3 | `4-marks.md` has one row per numbered finding, place, split and tense clause, each manuscript place with its path from the main file's folder. Split 42 (e) reads `W (1, 4)` for grant marker 1. |
| 4, Proof 1 | Condition 6 and C8 name marker 1's `Read` coverage of 17 of 33 files, and C8 is partial. Step 6's Step 0 in `plan.md` has the bullet on the file-reading tool. |
| 5, Proof 2 | "Judgment calls" and C70 in `.scratch/choices.md` state the placeholders, the classifier stop at 32354 characters, the two `Read` calls and the 44152-character grant prompts. Step 6's Step 0 names the cause. |
| 6, Proof 3 | The DONE / NOT DONE table has rows for verify 1 to 4 with their output. C4 says marker 2 names finding 68's missing quote and marker 1 does not. |
| 7, Standards 1 | The Open item G line in `plan.md` names C70 before its last clause and ends "(self-rule).". |
| 8, Standards 2 | Condition 4 names the two `sleep 10` reads as a departure. Step 6's Step 0 has the bullet on reading the served model with no sleep. |
| 9, Standards 3 | `4-report.md` and `4-marks.md` are rewritten with no semicolon in running prose outside code spans and tables (a count printed 0 for each, over 1600 and 1298 words). |
| 10, Standards 4 | "Files" lists the eleven files with their `wc -l` counts. |

# Marks of step 8

One table per run, one row per finding, further place, split and list entry, with the marks of both markers. The marks files are under `8-run/`. Two markers were resumed once for rows whose reason was missing or named only the new word: grant marker 1 for rows 8a, 8e, 16k, 16l, 16q, 16x and 16y (`grant-marks-1-resume.md`), and manuscript marker 2 for the group 9 entries it marked right and the nine group 12 entries (`manuscript-marks-2-resume.md`). Neither changed a mark. The manuscript report's findings are numbered as the report numbers them; the entries of its tense list (group 9) are numbered by their position in the Methodology list and the Results list, and the entries of groups 12 and 14 by their position in the group. The grant report numbers no finding, so its rows are numbered by group and a letter in the report's order, as grant marker 2 numbers them. A place in an included file is given with its path from the main file's folder.

The markers' own totals do not all agree with their marks. Manuscript marker 2 states 41 wrong rows and lists 28, and its marks hold 28. Grant marker 1 states 75 rows, 42 right and 33 wrong; its marks hold 74 rows, 42 right and 32 wrong. The tables below are read from the marks, row by row (`grep -c '^Place:' 8-run/grant-report.md` prints 74, and the manuscript report holds 60 numbered findings in groups 1 to 8, 122 tense entries, 4, 4, 9, 23 and 6 rows in groups 10 to 14).

## The manuscript run

228 rows.

| Group | Number | Place | Marker 1 | Marker 2 |
|---|---|---|---|---|
| 1. references/rules.md, "Hedging" | 1.1 | sections/abstract/abstract.tex:3 | wrong | wrong |
| 1. references/rules.md, "Hedging" | 1.2 | sections/abstract/abstract.tex:3 | wrong | right |
| 1. references/rules.md, "Hedging" | 1.3 | sections/abstract/abstract.tex:5 | right | right |
| 1. references/rules.md, "Hedging" | 1.4 | sections/abstract/abstract.tex:5 | right | right |
| 1. references/rules.md, "Hedging" | 1.5 | sections/1_introduction/introduction.tex:13 | right | right |
| 1. references/rules.md, "Hedging" | 1.6 | sections/1_introduction/introduction.tex:13 | right | right |
| 1. references/rules.md, "Hedging" | 1.7 | sections/1_introduction/introduction.tex:13 | right | right |
| 1. references/rules.md, "Hedging" | 1.8 | sections/6_conclusion/conclusion.tex:1 | right | right |
| 1. references/rules.md, "Hedging" | 1.9 | sections/5_discussion/discussion.tex:10 | wrong | wrong |
| 1. references/rules.md, "Hedging" | 1.10 | sections/5_discussion/discussion.tex:10 | wrong | wrong |
| 1. references/rules.md, "Hedging" | 1.11 | sections/5_discussion/discussion.tex:12 | right | right |
| 1. references/rules.md, "Hedging" | 1.12 | sections/5_discussion/discussion.tex:12 | wrong | right |
| 1. references/rules.md, "Hedging" | 1.13 | sections/5_discussion/discussion.tex:16 | right | right |
| 2. references/rules.md, "Limitations and alternative interpretations" | 2.1 | sections/4_experiments/d_results.tex:21 | wrong | right |
| 3. references/rules.md, "Evidence for claims" | 3.1 | sections/2_related_work/a_longitudinal_analysis.tex:1 | wrong | wrong |
| 3. references/rules.md, "Evidence for claims" | 3.2 | sections/2_related_work/a_longitudinal_analysis.tex:1 | right | right |
| 3. references/rules.md, "Evidence for claims" | 3.3 | sections/2_related_work/a_longitudinal_analysis.tex:1 | wrong | right |
| 3. references/rules.md, "Evidence for claims" | 3.4 | sections/5_discussion/discussion.tex:6 | right | right |
| 3. references/rules.md, "Evidence for claims" | 3.5 | sections/2_related_work/a_longitudinal_analysis.tex:5 | wrong | right |
| 3. references/rules.md, "Evidence for claims" | 3.6 | sections/2_related_work/b_pretraining.tex:3 | right | right |
| 3. references/rules.md, "Evidence for claims" | 3.7 | sections/2_related_work/b_pretraining.tex:1 | wrong | right |
| 3. references/rules.md, "Evidence for claims" | 3.8 | sections/1_introduction/introduction.tex:7 | right | right |
| 3. references/rules.md, "Evidence for claims" | 3.9 | sections/3_methodology/d_pretraining.tex:1 | wrong | right |
| 3. references/rules.md, "Evidence for claims" | 3.10 | sections/3_methodology/c_variants.tex:10 | right | right |
| 4. references/registers.md, "What the reader looks for" | 4.1 | sections/4_experiments/a_data.tex:1 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.1 | sections/abstract/abstract.tex:1 | wrong | right |
| 5. Prose standard, section A, vague qualifiers | 5.2 | sections/1_introduction/introduction.tex:1 | wrong | wrong |
| 5. Prose standard, section A, vague qualifiers | 5.3 | sections/1_introduction/introduction.tex:1 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.4 | sections/1_introduction/introduction.tex:5 | wrong | wrong |
| 5. Prose standard, section A, vague qualifiers | 5.5 | sections/1_introduction/introduction.tex:5 | wrong | wrong |
| 5. Prose standard, section A, vague qualifiers | 5.6 | sections/1_introduction/introduction.tex:7 | wrong | right |
| 5. Prose standard, section A, vague qualifiers | 5.7 | sections/2_related_work/a_longitudinal_analysis.tex:5 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.8 | sections/2_related_work/a_longitudinal_analysis.tex:7 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.9 | sections/2_related_work/b_pretraining.tex:1 | wrong | right |
| 5. Prose standard, section A, vague qualifiers | 5.10 | sections/3_methodology/a_problem_formulation.tex:1 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.11 | sections/3_methodology/b_architecture.tex:5 | wrong | wrong |
| 5. Prose standard, section A, vague qualifiers | 5.12 | sections/4_experiments/b_implementation.tex:9 | wrong | right |
| 5. Prose standard, section A, vague qualifiers | 5.13 | sections/4_experiments/d_results.tex:11 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.14 | sections/4_experiments/d_results.tex:11 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.15 | sections/4_experiments/d_results.tex:15 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.16 | sections/5_discussion/discussion.tex:8 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.17 | sections/5_discussion/discussion.tex:8 | right | right |
| 5. Prose standard, section A, vague qualifiers | 5.18 | sections/4_experiments/c_evaluation.tex:8 | wrong | wrong |
| 5. Prose standard, section A, vague qualifiers | 5.19 | sections/appendix/b_additional_results/1_baseline.tex:3 | wrong | right |
| 5. Prose standard, section A, vague qualifiers | 5.20 | sections/appendix/b_additional_results/2_reliability.tex:3 | wrong | wrong |
| 5. Prose standard, section A, vague qualifiers | 5.21 | sections/appendix/a_implementation/3_hyperparams.tex:3 | right | right |
| 6. references/rules.md, "Terms defined at first use" | 6.1 | sections/abstract/abstract.tex:1 | wrong | wrong |
| 6. references/rules.md, "Terms defined at first use" | 6.2 | sections/1_introduction/introduction.tex:11 | right | right |
| 6. references/rules.md, "Terms defined at first use" | 6.3 | sections/3_methodology/b_architecture.tex:14 | right | right |
| 6. references/rules.md, "Terms defined at first use" | 6.4 | sections/4_experiments/b_implementation.tex:3 | right | right |
| 7. references/registers.md, "Voice" | 7.1 | sections/3_methodology/a_problem_formulation.tex:1 | wrong | wrong |
| 7. references/registers.md, "Voice" | 7.2 | sections/3_methodology/d_pretraining.tex:3 | right | right |
| 7. references/registers.md, "Voice" | 7.3 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 7. references/registers.md, "Voice" | 7.4 | sections/3_methodology/d_pretraining.tex:10 | right | right |
| 7. references/registers.md, "Voice" | 7.5 | sections/5_discussion/discussion.tex:6 | right | right |
| 7. references/registers.md, "Voice" | 7.6 | sections/5_discussion/discussion.tex:6 | right | right |
| 8. references/rules.md, "Clear antecedents" | 8.1 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 8. references/rules.md, "Clear antecedents" | 8.2 | sections/3_methodology/d_pretraining.tex:15 | right | right |
| 8. references/rules.md, "Clear antecedents" | 8.3 | sections/appendix/a_implementation/3_hyperparams.tex:3 | right | right |
| 8. references/rules.md, "Clear antecedents" | 8.4 | sections/appendix/b_additional_results/2_reliability.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 1 | sections/2_related_work/a_longitudinal_analysis.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 2 | sections/2_related_work/a_longitudinal_analysis.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 3 | sections/3_methodology/b_architecture.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 4 | sections/3_methodology/b_architecture.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 5 | sections/3_methodology/b_architecture.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 6 | sections/3_methodology/b_architecture.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 7 | sections/3_methodology/b_architecture.tex:14 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 8 | sections/3_methodology/b_architecture.tex:21 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 9 | sections/3_methodology/b_architecture.tex:21 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 10 | sections/3_methodology/b_architecture.tex:21 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 11 | sections/3_methodology/b_architecture.tex:26 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 12 | sections/3_methodology/b_architecture.tex:26 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 13 | sections/3_methodology/b_architecture.tex:34 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 14 | sections/3_methodology/b_architecture.tex:39 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 15 | sections/3_methodology/b_architecture.tex:44 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 16 | sections/3_methodology/c_variants.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 17 | sections/3_methodology/c_variants.tex:10 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 18 | sections/3_methodology/d_pretraining.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 19 | sections/3_methodology/d_pretraining.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 20 | sections/3_methodology/d_pretraining.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 21 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 22 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 23 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 24 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 25 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 26 | sections/3_methodology/d_pretraining.tex:10 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 27 | sections/3_methodology/d_pretraining.tex:10 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 28 | sections/3_methodology/d_pretraining.tex:10 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 29 | sections/3_methodology/d_pretraining.tex:10 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 30 | sections/3_methodology/d_pretraining.tex:10 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 31 | sections/3_methodology/d_pretraining.tex:10 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 32 | sections/3_methodology/d_pretraining.tex:15 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 33 | sections/3_methodology/d_pretraining.tex:15 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 34 | sections/3_methodology/d_pretraining.tex:15 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 35 | sections/3_methodology/e_finetuning.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 36 | sections/3_methodology/e_finetuning.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 37 | sections/4_experiments/a_data.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 38 | sections/4_experiments/a_data.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 39 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 40 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 41 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 42 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 43 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 44 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 45 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 46 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 47 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 48 | sections/4_experiments/a_data.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 49 | sections/4_experiments/b_implementation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 50 | sections/4_experiments/b_implementation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 51 | sections/4_experiments/b_implementation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 52 | sections/4_experiments/b_implementation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 53 | sections/4_experiments/b_implementation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 54 | sections/4_experiments/b_implementation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 55 | sections/4_experiments/b_implementation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 56 | sections/4_experiments/b_implementation.tex:3 | wrong | wrong |
| 9. references/rules.md, "Tense per section" | Methodology 57 | sections/4_experiments/b_implementation.tex:3 | wrong | wrong |
| 9. references/rules.md, "Tense per section" | Methodology 58 | sections/4_experiments/b_implementation.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 59 | sections/4_experiments/b_implementation.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 60 | sections/4_experiments/b_implementation.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 61 | sections/4_experiments/b_implementation.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 62 | sections/4_experiments/b_implementation.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 63 | sections/4_experiments/b_implementation.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 64 | sections/4_experiments/b_implementation.tex:7 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 65 | sections/4_experiments/b_implementation.tex:7 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 66 | sections/4_experiments/b_implementation.tex:7 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 67 | sections/4_experiments/b_implementation.tex:7 | wrong | wrong |
| 9. references/rules.md, "Tense per section" | Methodology 68 | sections/4_experiments/b_implementation.tex:9 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 69 | sections/4_experiments/b_implementation.tex:9 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 70 | sections/4_experiments/b_implementation.tex:9 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 71 | sections/4_experiments/b_implementation.tex:9 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 72 | sections/4_experiments/b_implementation.tex:11 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 73 | sections/4_experiments/b_implementation.tex:11 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 74 | sections/4_experiments/b_implementation.tex:11 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 75 | sections/4_experiments/c_evaluation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 76 | sections/4_experiments/c_evaluation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 77 | sections/4_experiments/c_evaluation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 78 | sections/4_experiments/c_evaluation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 79 | sections/4_experiments/c_evaluation.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 80 | sections/4_experiments/c_evaluation.tex:6 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 81 | sections/appendix/a_implementation/1_conv_layer.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 82 | sections/appendix/a_implementation/2_augmentations.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 83 | sections/appendix/a_implementation/2_augmentations.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 84 | sections/appendix/a_implementation/2_augmentations.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 85 | sections/appendix/a_implementation/2_augmentations.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Methodology 86 | sections/appendix/a_implementation/2_augmentations.tex:1 | right | right |
| 9. references/rules.md, "Tense per section" | Results 1 | sections/4_experiments/d_results.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Results 2 | sections/4_experiments/d_results.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Results 3 | sections/4_experiments/d_results.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Results 4 | sections/4_experiments/d_results.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Results 5 | sections/4_experiments/d_results.tex:5 | wrong | wrong |
| 9. references/rules.md, "Tense per section" | Results 6 | sections/4_experiments/d_results.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Results 7 | sections/4_experiments/d_results.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Results 8 | sections/4_experiments/d_results.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Results 9 | sections/4_experiments/d_results.tex:5 | right | right |
| 9. references/rules.md, "Tense per section" | Results 10 | sections/4_experiments/d_results.tex:9 | wrong | wrong |
| 9. references/rules.md, "Tense per section" | Results 11 | sections/4_experiments/d_results.tex:9 | right | right |
| 9. references/rules.md, "Tense per section" | Results 12 | sections/4_experiments/d_results.tex:9 | right | right |
| 9. references/rules.md, "Tense per section" | Results 13 | sections/4_experiments/d_results.tex:11 | right | right |
| 9. references/rules.md, "Tense per section" | Results 14 | sections/4_experiments/d_results.tex:11 | right | right |
| 9. references/rules.md, "Tense per section" | Results 15 | sections/4_experiments/d_results.tex:15 | right | right |
| 9. references/rules.md, "Tense per section" | Results 16 | sections/4_experiments/d_results.tex:19 | wrong | wrong |
| 9. references/rules.md, "Tense per section" | Results 17 | sections/4_experiments/d_results.tex:19 | right | right |
| 9. references/rules.md, "Tense per section" | Results 18 | sections/4_experiments/d_results.tex:19 | right | right |
| 9. references/rules.md, "Tense per section" | Results 19 | sections/4_experiments/d_results.tex:19 | right | right |
| 9. references/rules.md, "Tense per section" | Results 20 | sections/4_experiments/d_results.tex:21 | right | right |
| 9. references/rules.md, "Tense per section" | Results 21 | sections/4_experiments/d_results.tex:21 | right | right |
| 9. references/rules.md, "Tense per section" | Results 22 | sections/4_experiments/d_results.tex:25 | right | right |
| 9. references/rules.md, "Tense per section" | Results 23 | sections/4_experiments/d_results.tex:25 | right | right |
| 9. references/rules.md, "Tense per section" | Results 24 | sections/4_experiments/d_results.tex:25 | wrong | wrong |
| 9. references/rules.md, "Tense per section" | Results 25 | sections/4_experiments/d_results.tex:25 | right | right |
| 9. references/rules.md, "Tense per section" | Results 26 | sections/4_experiments/d_results.tex:29 | wrong | wrong |
| 9. references/rules.md, "Tense per section" | Results 27 | sections/4_experiments/d_results.tex:29 | right | right |
| 9. references/rules.md, "Tense per section" | Results 28 | sections/4_experiments/d_results.tex:29 | right | right |
| 9. references/rules.md, "Tense per section" | Results 29 | sections/4_experiments/d_results.tex:29 | wrong | right |
| 9. references/rules.md, "Tense per section" | Results 30 | sections/4_experiments/d_results.tex:29 | right | right |
| 9. references/rules.md, "Tense per section" | Results 31 | sections/4_experiments/d_results.tex:29 | right | right |
| 9. references/rules.md, "Tense per section" | Results 32 | sections/appendix/b_additional_results/1_baseline.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Results 33 | sections/appendix/b_additional_results/2_reliability.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Results 34 | sections/appendix/b_additional_results/2_reliability.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Results 35 | sections/appendix/b_additional_results/2_reliability.tex:3 | right | right |
| 9. references/rules.md, "Tense per section" | Results 36 | sections/appendix/b_additional_results/2_reliability.tex:3 | right | right |
| 10. Prose standard, section C | 10.1 | sections/4_experiments/d_results.tex:3 | right | right |
| 10. Prose standard, section C | 10.2 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 10. Prose standard, section C | 10.3 | sections/3_methodology/d_pretraining.tex:15 | right | right |
| 10. Prose standard, section C | 10.4 | sections/appendix/a_implementation/3_hyperparams.tex:3 | wrong | right |
| 11. Prose standard, section A, banned filler and flagged terms | 11.1 | sections/2_related_work/a_longitudinal_analysis.tex:3 | right | wrong |
| 11. Prose standard, section A, banned filler and flagged terms | 11.2 | sections/2_related_work/b_pretraining.tex:3 | right | right |
| 11. Prose standard, section A, banned filler and flagged terms | 11.3 | sections/2_related_work/b_pretraining.tex:5 | right | right |
| 11. Prose standard, section A, banned filler and flagged terms | 11.4 | sections/4_experiments/a_data.tex:3 | wrong | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.1 | sections/3_methodology/c_variants.tex:1 | right | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.2 | sections/4_experiments/c_evaluation.tex:1 | right | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.3 | sections/4_experiments/d_results.tex:9 | right | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.4 | sections/4_experiments/d_results.tex:5 | right | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.5 | sections/4_experiments/d_results.tex:5 | right | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.6 | sections/4_experiments/d_results.tex:15 | right | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.7 | sections/appendix/b_additional_results/1_baseline.tex:3 | right | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.8 | sections/appendix/b_additional_results/2_reliability.tex:3 | right | right |
| 12. Prose standard, section D, "No synonym cycling" | 12.9 | tables/hyperparams.tex:36 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.1 | sections/abstract/abstract.tex:3 | wrong | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.2 | sections/1_introduction/introduction.tex:13 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.3 | sections/1_introduction/introduction.tex:13 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.4 | sections/2_related_work/a_longitudinal_analysis.tex:3 | wrong | wrong |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.5 | sections/2_related_work/a_longitudinal_analysis.tex:5 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.6 | sections/2_related_work/b_pretraining.tex:3 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.7 | sections/3_methodology/a_problem_formulation.tex:1 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.8 | sections/3_methodology/d_pretraining.tex:8 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.9 | sections/3_methodology/d_pretraining.tex:8 | wrong | wrong |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.10 | sections/3_methodology/d_pretraining.tex:10 and sections/3_methodology/d_pretraining.tex:15 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.11 | sections/3_methodology/d_pretraining.tex:15 | wrong | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.12 | sections/4_experiments/a_data.tex:1 | wrong | wrong |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.13 | sections/4_experiments/a_data.tex:3 | wrong | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.14 | sections/4_experiments/a_data.tex:3 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.15 | sections/4_experiments/a_data.tex:3 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.16 | sections/4_experiments/b_implementation.tex:1 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.17 | sections/4_experiments/c_evaluation.tex:1 | wrong | wrong |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.18 | sections/4_experiments/d_results.tex:5 | right | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.19 | sections/4_experiments/d_results.tex:19 | wrong | wrong |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.20 | sections/5_discussion/discussion.tex:12 | wrong | wrong |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.21 | sections/6_conclusion/conclusion.tex:1 | wrong | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.22 | sections/6_conclusion/conclusion.tex:1 | wrong | right |
| 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 13.23 | sections/appendix/b_additional_results/2_reliability.tex:3 | right | right |
| 14. Prose standard, section 0, "Em dash: zero" (spaced hyphen or "--" as an aside) | 14.1 | main.tex:47 | right | right |
| 14. Prose standard, section 0, "Em dash: zero" (spaced hyphen or "--" as an aside) | 14.2 | main.tex:49 | right | right |
| 14. Prose standard, section 0, "Em dash: zero" (spaced hyphen or "--" as an aside) | 14.3 | main.tex:51 | right | right |
| 14. Prose standard, section 0, "Em dash: zero" (spaced hyphen or "--" as an aside) | 14.4 | main.tex:53 | right | right |
| 14. Prose standard, section 0, "Em dash: zero" (spaced hyphen or "--" as an aside) | 14.5 | main.tex:57 | right | right |
| 14. Prose standard, section 0, "Em dash: zero" (spaced hyphen or "--" as an aside) | 14.6 | sections/5_discussion/discussion.tex:1 | wrong | wrong |

## The grant run

74 rows.

| Group | Number | Place | Marker 1 | Marker 2 |
|---|---|---|---|---|
| 1. references/rules.md, "Hedging" | 1a | paragraph 2 | right | right |
| 1. references/rules.md, "Hedging" | 1b | paragraph 35 | wrong | right |
| 1. references/rules.md, "Hedging" | 1c | paragraph 48 | wrong | wrong |
| 2. Prose standard, section A, vague qualifiers | 2a | paragraph 8 | right | right |
| 2. Prose standard, section A, vague qualifiers | 2b | paragraph 11 | right | right |
| 2. Prose standard, section A, vague qualifiers | 2c | paragraph 34 | right | right |
| 2. Prose standard, section A, vague qualifiers | 2d | paragraph 34 | right | right |
| 2. Prose standard, section A, vague qualifiers | 2e | paragraph 34 | wrong | wrong |
| 2. Prose standard, section A, vague qualifiers | 2f | paragraph 40 | wrong | wrong |
| 2. Prose standard, section A, vague qualifiers | 2g | paragraph 41 | right | right |
| 2. Prose standard, section A, vague qualifiers | 2h | paragraph 42 | wrong | wrong |
| 2. Prose standard, section A, vague qualifiers | 2i | paragraph 45 | right | right |
| 3. references/rules.md, "Limitations and alternative interpretations" | 3a | paragraph 48 | right | wrong |
| 4. references/rules.md, "Reader's question per section" (Methodology) | 4a | paragraph 40 | wrong | wrong |
| 5. references/registers.md, "What the reader looks for" | 5a | paragraph 42 | right | right |
| 6. references/rules.md, "Evidence for claims" | 6a | paragraph 40 | right | right |
| 7. references/rules.md, "Terms defined at first use" | 7a | paragraph 8 | wrong | wrong |
| 7. references/rules.md, "Terms defined at first use" | 7b | paragraph 31 | wrong | wrong |
| 7. references/rules.md, "Terms defined at first use" | 7c | paragraph 35 | right | right |
| 7. references/rules.md, "Terms defined at first use" | 7d | paragraph 35 | wrong | right |
| 7. references/rules.md, "Terms defined at first use" | 7e | paragraph 40 | right | right |
| 7. references/rules.md, "Terms defined at first use" | 7f | paragraph 41 | right | right |
| 8. Prose standard, section D, "No synonym cycling" | 8a | paragraph 35 | right | right |
| 8. Prose standard, section D, "No synonym cycling" | 8b | paragraph 41 | right | right |
| 8. Prose standard, section D, "No synonym cycling" | 8c | paragraph 41 | wrong | right |
| 8. Prose standard, section D, "No synonym cycling" | 8d | paragraph 42 | right | right |
| 8. Prose standard, section D, "No synonym cycling" | 8e | paragraph 42 | right | right |
| 8. Prose standard, section D, "No synonym cycling" | 8f | paragraph 42 | right | right |
| 8. Prose standard, section D, "No synonym cycling" | 8g | paragraph 42 | wrong | wrong |
| 8. Prose standard, section D, "No synonym cycling" | 8h | paragraph 45 | right | right |
| 8. Prose standard, section D, "No synonym cycling" | 8i | paragraph 46 | wrong | wrong |
| 8. Prose standard, section D, "No synonym cycling" | 8j | paragraph 47 | wrong | wrong |
| 9. references/registers.md, "Voice" | 9a | paragraph 31 | right | right |
| 9. references/registers.md, "Voice" | 9b | paragraph 46 | right | right |
| 10. references/rules.md, "Clear antecedents" | 10a | paragraph 35 | right | right |
| 11. Prose standard, section E, "Sentence length" | 11a | paragraph 34 | right | right |
| 11. Prose standard, section E, "Sentence length" | 11b | paragraph 34 | right | right |
| 11. Prose standard, section E, "Sentence length" | 11c | paragraph 35 | wrong | wrong |
| 11. Prose standard, section E, "Sentence length" | 11d | paragraph 40 | wrong | wrong |
| 11. Prose standard, section E, "Sentence length" | 11e | paragraph 41 | wrong | wrong |
| 11. Prose standard, section E, "Sentence length" | 11f | paragraph 42 | wrong | right |
| 12. references/rules.md, "Formality" | 12a | paragraph 42 | wrong | right |
| 13. Prose standard, section 0, "No repeated construction" | 13a | paragraph 42 | wrong | wrong |
| 13. Prose standard, section 0, "No repeated construction" | 13b | paragraph 43 | right | right |
| 14. references/rules.md, "Tense per section" | 14a | paragraph 34 | right | right |
| 14. references/rules.md, "Tense per section" | 14b | paragraph 48 | wrong | wrong |
| 15. Prose standard, section E, "Passive voice" | 15a | paragraph 31 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16a | paragraph 8 | wrong | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16b | paragraph 11 | wrong | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16c | paragraph 31 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16d | paragraph 31 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16e | paragraph 31 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16f | paragraph 34 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16g | paragraph 34 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16h | paragraph 34 | wrong | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16i | paragraph 35 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16j | paragraph 35 | wrong | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16k | paragraph 35 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16l | paragraph 35 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16m | paragraph 35 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16n | paragraph 40 | wrong | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16o | paragraph 40 | wrong | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16p | paragraph 40 | wrong | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16q | paragraph 41 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16r | paragraph 41 | wrong | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16s | paragraph 41 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16t | paragraph 41 | wrong | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16u | paragraph 42 | wrong | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16v | paragraph 42 | wrong | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16w | paragraph 42 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16x | paragraph 42 | right | right |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16y | paragraph 42 | right | wrong |
| 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" | 16z | paragraph 48 | wrong | wrong |
| 17. Prose standard, section B, ASCII | 17a | paragraph 64 [word/header1.xml] | right | wrong |

## Rows not marked right by both

### The manuscript run (48 rows)

- 1. Hedging, 1.1, sections/abstract/abstract.tex:3.
  - Marker 1: wrong (4): the replacement brings AUPRC and "expected calibration error" into the abstract undefined, and "improves ... reliability" is checked only against ECE while MCE rises for 11 of 15 models and one Brier score rises, unnamed.
  - Marker 2: wrong (4): AUPRC comes into the abstract before its definition at c_evaluation.tex:1, and the reliability claim's limit names one ECE case while MCE rises for all five T1 DCE-MRI variants.
- 1. Hedging, 1.2, sections/abstract/abstract.tex:3.
  - Marker 1: wrong (4): the rewrite drops "we" from the authors' finding, an unnamed Voice break of the Medicine and Health register, and makes the act of applying the evidence.
  - Marker 2: right: "indicates" is the moderate device for a single-cohort result, and the claim is kept.
- 1. Hedging, 1.9, sections/5_discussion/discussion.tex:10.
  - Marker 1: wrong (4): the replacement keeps the unqualified "aligned the models closer to the target distribution", which fails for HCCNet-F on T1 IOP & T2-MRI (ECE 0.182 to 0.204) and for MCE, with no limit bracketed.
  - Marker 2: wrong (4): the same unlimited relation, an unnamed "Limitations and alternative interpretations" break, with the 0.182 to 0.204 case in tables/results_reliability.tex:23.
- 1. Hedging, 1.10, sections/5_discussion/discussion.tex:10.
  - Marker 1: wrong (4): "on average more reliable" fails on MCE for the two modality groups named, and the size word "moderate improvements" is kept unnamed.
  - Marker 2: wrong (4): the limit is checked only against ECE; MCE rises for every T1 DCE-MRI variant, which is not named in a bracket.
- 1. Hedging, 1.12, sections/5_discussion/discussion.tex:12.
  - Marker 1: wrong (4): "These at most marginal improvements" brings in a section A size word, and the sentence keeps two ideas that each stand alone, an unnamed Formality break.
  - Marker 2: right: "may reflect" hedges the attribution and the noun phrase ends the bare "this".
- 2. Limitations and alternative interpretations, 2.1, sections/4_experiments/d_results.tex:21.
  - Marker 1: wrong (4): the replacement keeps "More interestingly", a performative aside of section 0, unnamed.
  - Marker 2: right: the replacement names the one case where ECE rises, and the average ECE falls in all three groups.
- 3. Evidence for claims, 3.1, sections/2_related_work/a_longitudinal_analysis.tex:1.
  - Marker 1: wrong (4): the replacement keeps "predominately", a vague qualifier, unnamed.
  - Marker 2: wrong (4): the same, and the report itself treats "predominantly" as a qualifier in 5.20.
- 3. Evidence for claims, 3.3, sections/2_related_work/a_longitudinal_analysis.tex:1.
  - Marker 1: wrong (2): the Also line on "Vague language" names the row "in recent years", and "recent studies" is not a phrase of that row.
  - Marker 2: right: it reads that row as covering "recent studies", and notes that a strictly literal reading would fail condition 2.
- 3. Evidence for claims, 3.5, sections/2_related_work/a_longitudinal_analysis.tex:5.
  - Marker 1: wrong (4): the kept "our study uses a hybrid model architecture" gives an authors' decision to the study, the Voice break 7.1 and 7.2 fix, unnamed.
  - Marker 2: right: the ranking "third most common" has no source, and the bracket supplies one.
- 3. Evidence for claims, 3.7, sections/2_related_work/b_pretraining.tex:1.
  - Marker 1: wrong (2): introduction.tex:5 gives a source for the same claim (kumar2024improving), so the claim is not one without evidence.
  - Marker 2: right: the bracket follows the "many studies" row and supplies the evidence.
- 3. Evidence for claims, 3.9, sections/3_methodology/d_pretraining.tex:1.
  - Marker 1: wrong (4): the replacement keeps "repeatedly", a frequency word of the "often" kind, unnamed.
  - Marker 2: right: the claim has no citation, and the bracket at the sentence end supplies it.
- 5. Prose standard, section A, vague qualifiers, 5.1, sections/abstract/abstract.tex:1.
  - Marker 1: wrong (2, 4): the Also line calls abstract.tex:1 the first use of MRI, but MRI first stands in the title at main.tex:45, so the definition here leaves an earlier undefined use.
  - Marker 2: right: "considerably" becomes a bracket, and MRI is defined at what it takes as its first use.
- 5. Prose standard, section A, vague qualifiers, 5.2, sections/1_introduction/introduction.tex:1.
  - Marker 1: wrong (4): the Clear antecedents fix is an instruction ("begin the sentence with ..."), and the written replacement still opens "This is especially relevant".
  - Marker 2: wrong (4): the same: the antecedent fix is an instruction, so the one replacement does not end every break it names.
- 5. Prose standard, section A, vague qualifiers, 5.4, sections/1_introduction/introduction.tex:5.
  - Marker 1: wrong (4): the replacement drops "Traditional", the word that sets which approaches the claim covers.
  - Marker 2: wrong (4): the same scope word is dropped, which no named rule cuts.
- 5. Prose standard, section A, vague qualifiers, 5.5, sections/1_introduction/introduction.tex:5.
  - Marker 1: wrong (4): "often small" becomes "small [the dataset sizes ...]", so medical datasets read as small in every case.
  - Marker 2: wrong (4): the same: the bracket names sizes, not a share, and the claim reads as universal.
- 5. Prose standard, section A, vague qualifiers, 5.6, sections/1_introduction/introduction.tex:7.
  - Marker 1: wrong (2): the Also line names the row "many studies", and the passage's phrase is "many existing approaches", which is not that row.
  - Marker 2: right: the bracket follows the "many studies" row, and neither option leaves the claim universal.
- 5. Prose standard, section A, vague qualifiers, 5.9, sections/2_related_work/b_pretraining.tex:1.
  - Marker 1: wrong (2): the Also line names the row "some researchers", and the passage's phrase is "some ... studies".
  - Marker 2: right: "some" becomes the named studies with their citations, as that row gives.
- 5. Prose standard, section A, vague qualifiers, 5.11, sections/3_methodology/b_architecture.tex:5.
  - Marker 1: wrong (4): "typically encountered in volumetric data" is cut so that the claim reads as true of all volumetric data, and the bracket asks for sizes, not a share.
  - Marker 2: wrong (4): the same.
- 5. Prose standard, section A, vague qualifiers, 5.12, sections/4_experiments/b_implementation.tex:9.
  - Marker 1: wrong (4): the replacement brings AUPRC and AUROC into b_implementation.tex:9, before c_evaluation.tex:1 defines them.
  - Marker 2: right: the range 0.329 to 0.628 stands in tables/results_finetune.tex, and the tense is past.
- 5. Prose standard, section A, vague qualifiers, 5.18, sections/4_experiments/c_evaluation.tex:8.
  - Marker 1: wrong (4): "consecutive folds" becomes "any two folds" outside any bracket, a claim the draft does not make.
  - Marker 2: wrong (4): the same change of a scope word that no named rule asks for.
- 5. Prose standard, section A, vague qualifiers, 5.19, sections/appendix/b_additional_results/1_baseline.tex:3.
  - Marker 1: wrong (4): the replacement keeps "far less pronounced", a size word, unnamed, though the tables give the numbers.
  - Marker 2: right: "generally" is cut on the data of tables/results_baseline.tex, which the finding names.
- 5. Prose standard, section A, vague qualifiers, 5.20, sections/appendix/b_additional_results/2_reliability.tex:3.
  - Marker 1: wrong (4): the bracket's "or" alternative leaves "driven by imaging modality rather than model complexity" universal once supplied.
  - Marker 2: wrong (4): the same.
- 6. Terms defined at first use, 6.1, sections/abstract/abstract.tex:1.
  - Marker 1: wrong (2, 4): CNN first stands in the title at main.tex:45, so abstract.tex:1 is not its first use and the definition leaves the earlier use undefined.
  - Marker 2: wrong (4): the passage also holds "ConvNeXt" at its first use, never defined in the draft, and the finding does not name it.
- 7. Voice, 7.1, sections/3_methodology/a_problem_formulation.tex:1.
  - Marker 1: wrong (4): "aims" becomes "aimed", a tense change the finding does not name, while 7.2 to 7.4 name theirs.
  - Marker 2: wrong (4): the same.
- 9. Tense per section, Methodology 56, sections/4_experiments/b_implementation.tex:3.
  - Marker 1: wrong: the entry has no passage-and-replacement pair, only a reference to finding 6.4.
  - Marker 2: wrong (4): no replacement, and a reference to another finding, which SKILL.md forbids.
- 9. Tense per section, Methodology 57, sections/4_experiments/b_implementation.tex:3.
  - Marker 1: wrong (2): "just 8000 training steps" is a minimality claim that section A keeps, so the Also break on filler is not a break.
  - Marker 2: wrong (2): the same.
- 9. Tense per section, Methodology 67, sections/4_experiments/b_implementation.tex:7.
  - Marker 1: wrong (4): the cut of "slightly" answers section A's vague-qualifier rule, which the entry does not name; the passage also belongs in group 5.
  - Marker 2: wrong (4): the cut answers section A's rule, and the entry does not name it.
- 9. Tense per section, Results 5, sections/4_experiments/d_results.tex:5.
  - Marker 1: wrong (4): "markedly" is kept, a size word, unnamed, with the numbers in the same sentence.
  - Marker 2: wrong (4): the same.
- 9. Tense per section, Results 10, sections/4_experiments/d_results.tex:9.
  - Marker 1: wrong (4): "closely" is kept, a size word for a deviation the MAE quantifies, unnamed.
  - Marker 2: wrong (4): the same.
- 9. Tense per section, Results 16, sections/4_experiments/d_results.tex:19.
  - Marker 1: wrong (4): "largely" is kept, a vague qualifier, unnamed.
  - Marker 2: wrong (4): the same.
- 9. Tense per section, Results 24, sections/4_experiments/d_results.tex:25.
  - Marker 1: wrong (4): "essentially" is kept, an approximating qualifier, unnamed.
  - Marker 2: wrong (4): the same.
- 9. Tense per section, Results 26, sections/4_experiments/d_results.tex:29.
  - Marker 1: wrong (4): "essentially all" is kept unnamed, and the table has CNN-only at 0.672 above both stages at 0.588.
  - Marker 2: wrong (4): "essentially all" is kept, unnamed.
- 9. Tense per section, Results 29, sections/4_experiments/d_results.tex:29.
  - Marker 1: wrong (4): "clearly" is kept, a size word for the gap 0.524 against 0.361, unnamed.
  - Marker 2 (on its resume): right: "clearly" says the difference lies outside the tie rule of c_evaluation.tex:8, and the table gives 0.524 and 0.361 with standard deviations 0.057 and 0.037, so the draft's own rule and data hold it.
- 10. Prose standard, section C, 10.4, sections/appendix/a_implementation/3_hyperparams.tex:3.
  - Marker 1: wrong (4): the replacement brings in "projection head", which the draft never defines.
  - Marker 2: right: the opener is cut, "slightly" becomes the specific claim, and the tense is past.
- 11. Prose standard, section A, banned filler and flagged terms, 11.1, sections/2_related_work/a_longitudinal_analysis.tex:3.
  - Marker 1: right: "simple" carries a claim and the bracket asks for the concrete fact; the tense break is named.
  - Marker 2: wrong (4): the replacement's subordinate clause has no verb, so it does not read as a sentence, and it gives a place group 9 already lists.
- 11. Prose standard, section A, banned filler and flagged terms, 11.4, sections/4_experiments/a_data.tex:3.
  - Marker 1: wrong (2): "robust" is the draft's own term in the statistical sense rules.md exempts, "reliable" is the draft's term for calibration, and the note that the place is not in the tense list is false.
  - Marker 2: right: "robust" is not the statistical term here, and "reliable" comes from the table of replacements; it also names the false note.
- 13. Prose standard, section D, paragraphs, 13.1, sections/abstract/abstract.tex:3.
  - Marker 1: wrong (4): its second sentence is 1.2's text and carries the same unnamed Voice break.
  - Marker 2: right: five sentences split 2 and 3, one idea each, and the text matches 1.2.
- 13. Prose standard, section D, paragraphs, 13.4, sections/2_related_work/a_longitudinal_analysis.tex:3.
  - Marker 1: wrong (4): the second sentence keeps "have therefore increasingly employed", a present perfect for cited studies and a vague trend word, neither named.
  - Marker 2: wrong (4): it carries 11.1's replacement, which does not read as a sentence, and keeps the same present perfect and "increasingly", unnamed.
- 13. Prose standard, section D, paragraphs, 13.9, sections/3_methodology/d_pretraining.tex:8.
  - Marker 1: wrong (4): the second sentence's three semicolon-separated items are list-shaped items in paragraph form, unnamed.
  - Marker 2: wrong (4): the same.
- 13. Prose standard, section D, paragraphs, 13.11, sections/3_methodology/d_pretraining.tex:15.
  - Marker 1: wrong (4): it changes "is pre-trained" and "is then fine-tuned" to the past, which neither the tense list nor a Tense line of the finding names.
  - Marker 2: right: the parts are input construction and stem expansion, and the past tenses match the tense list.
- 13. Prose standard, section D, paragraphs, 13.12, sections/4_experiments/a_data.tex:1.
  - Marker 1: wrong (4): counted with the sentence 4.1 adds, the first part holds five sentences, and no further split is given.
  - Marker 2: wrong (4): the same.
- 13. Prose standard, section D, paragraphs, 13.13, sections/4_experiments/a_data.tex:3.
  - Marker 1: wrong (4): it carries 11.4's change of "robust" to "reliable", which marker 1 marks as not called for.
  - Marker 2: right: the parts hold 2, 4, 3 and 1 sentences, and the text matches 11.4 and the tense entries.
- 13. Prose standard, section D, paragraphs, 13.17, sections/4_experiments/c_evaluation.tex:1.
  - Marker 1: wrong (4): the second sentence keeps six metrics after a colon in paragraph form, unnamed.
  - Marker 2: wrong (4): the same.
- 13. Prose standard, section D, paragraphs, 13.19, sections/4_experiments/d_results.tex:19.
  - Marker 1: wrong (4): it keeps "largely", unnamed.
  - Marker 2: wrong (4): the same.
- 13. Prose standard, section D, paragraphs, 13.20, sections/5_discussion/discussion.tex:12.
  - Marker 1: wrong (4): it keeps "comparatively little" and "at most marginal improvements", size words, unnamed.
  - Marker 2: wrong (4): its first sentence states the CNN backbone's dominance with no limit, while tables/results_pretrain_ablation.tex:20-21 has the Transformer encoder alone above the CNN backbone alone for T1 IOP & T2-MRI (0.457 against 0.447), unnamed.
- 13. Prose standard, section D, paragraphs, 13.21, sections/6_conclusion/conclusion.tex:1.
  - Marker 1: wrong (4): it keeps "at most marginal gains", unnamed.
  - Marker 2: right: the parts hold 3, 2 and 3 sentences, and the text matches 1.8.
- 13. Prose standard, section D, paragraphs, 13.22, sections/6_conclusion/conclusion.tex:1.
  - Marker 1: wrong (4): the second sentence joins two ideas that each stand alone with "while", an unnamed Formality break.
  - Marker 2: right: the parts are generalizability and future work.
- 14. Prose standard, section 0, "Em dash: zero", 14.6, sections/5_discussion/discussion.tex:1.
  - Marker 1: wrong (4): the replacement keeps "This study therefore developed", the Voice break 7.5 fixes, unnamed.
  - Marker 2: wrong (4): the same.

### The grant run (35 rows)

- 1. Hedging, 1b, paragraph 35.
  - Marker 1: wrong (2): the Also line on "Clear antecedents" does not hold, since "does" can only stand for "exceeds the scan-to-scan variation", so "it" has a clear antecedent.
  - Marker 2: right: "could" hedges the untested consequence, and "the change" ends the unclear "it" the Also line names.
- 1. Hedging, 1c, paragraph 48.
  - Marker 1: wrong (4): the split drops "If the hypothesis holds" from the new sentence on transfer, which the condition governs in the draft.
  - Marker 2: wrong (4): the same, against SKILL.md's rule that a split keeps an opening condition in each part it governs.
- 2. Prose standard, section A, vague qualifiers, 2e, paragraph 34.
  - Marker 1: wrong (4, and 2 for the synonym line): "serial scans" covers every imaging modality here, and "serial MRI studies" narrows the knowledge-gap claim to MRI.
  - Marker 2: wrong (2, 4): the same; reference 7 is CT radiomics, so the synonym line does not hold and the scope changes.
- 2. Prose standard, section A, vague qualifiers, 2f, paragraph 40.
  - Marker 1: wrong (4): the replacement keeps "scans" for sequences, which group 8's line names as a break, and the 35-word sentence-length break is not named.
  - Marker 2: wrong (4): the 35-word sentence-length break is not named.
- 2. Prose standard, section A, vague qualifiers, 2h, paragraph 42.
  - Marker 1: wrong (4): the passage is 43 words long, and the finding has no Also line for sentence length.
  - Marker 2: wrong (4): the same.
- 3. Limitations and alternative interpretations, 3a, paragraph 48.
  - Marker 1: right: the limit to hepatitis B virus-related cirrhosis comes from reference 8's title, and the sentences run 12 and 19 words.
  - Marker 2: wrong (4): the replacement brings in "hepatitis B virus", which the draft never defines at or before paragraph 48.
- 4. Reader's question per section, 4a, paragraph 40.
  - Marker 1: wrong (4): the 31-word sentence is kept whole and sentence length is not named; it also doubts the rule's reading, uncounted.
  - Marker 2: wrong (2, 4): paragraph 42 of the same section states the limit, and the replacement brings in "80 percent power" undefined, repeats paragraph 42 and keeps the 31-word sentence unnamed.
- 7. Terms defined at first use, 7a, paragraph 8.
  - Marker 1: wrong (4): the passage has 29 words, and the replacement makes it 32 with the length break neither ended nor named.
  - Marker 2: wrong (4): the same, at 33 words.
- 7. Terms defined at first use, 7b, paragraph 31.
  - Marker 1: wrong (4): a written sentence has 30 words though the finding names sentence length, and "kind of MRI scan" brings back "scan" for a sequence.
  - Marker 2: wrong (2, 4): "atlas" is first used in paragraph 25, the 30-word sentence, "matched" dropped, and "sequence" renamed.
- 7. Terms defined at first use, 7d, paragraph 35.
  - Marker 1: wrong (4): the replacement keeps "into real liver scans" for the cohort's studies, the unnamed scan-for-study synonym.
  - Marker 2: right: "readout" gets a bracket, "detection limit" and "we" end their breaks, and the sentences run 17 words or fewer.
- 8. Prose standard, section D, "No synonym cycling", 8c, paragraph 41.
  - Marker 1: wrong (4): "a detection limit" becomes "the detection limit", an article SKILL.md keeps, and the sentence grows from 21 to 26 words.
  - Marker 2: right: the articles both refer to the one set of components and the one detection limit, so the scope is unchanged.
- 8. Prose standard, section D, "No synonym cycling", 8g, paragraph 42.
  - Marker 1: wrong (4): the passage has 38 words, and no Also line names sentence length.
  - Marker 2: wrong (4): the same.
- 8. Prose standard, section D, "No synonym cycling", 8i, paragraph 46.
  - Marker 1: wrong (4): the WP1 item stays 42 words with five list-shaped actions, and neither break is named.
  - Marker 2: wrong (4): the same, about 40 words, in a passage of over 80 words with no length line.
- 8. Prose standard, section D, "No synonym cycling", 8j, paragraph 47.
  - Marker 1: wrong (2, 4): the added "Risks and mitigation:" duplicates the draft's label, items (i) and (iv) stay at about 31 and 43 words, "each scan's signal" is left, and the antecedent line does not hold.
  - Marker 2: wrong (4): the duplicated label, items (i) and (iv) at 30 and 43 words unnamed, and item (iv) keeps four mitigations in paragraph form.
- 11. Prose standard, section E, "Sentence length", 11c, paragraph 35.
  - Marker 1: wrong (4): the first new sentence still has 28 words.
  - Marker 2: wrong (4): the same.
- 11. Prose standard, section E, "Sentence length", 11d, paragraph 40.
  - Marker 1: wrong (4): the second new sentence has 29 words.
  - Marker 2: wrong (4): the same.
- 11. Prose standard, section E, "Sentence length", 11e, paragraph 41.
  - Marker 1: wrong (4): the first new sentence has 28 words.
  - Marker 2: wrong (4): the same.
- 11. Prose standard, section E, "Sentence length", 11f, paragraph 42.
  - Marker 1: wrong (4): the second sentence still joins two independent claims, an unnamed Formality break.
  - Marker 2: right: sentences of 19 and 24 words, "the tested study" for "it", every number kept.
- 12. references/rules.md, "Formality", 12a, paragraph 42.
  - Marker 1: wrong (4): the passage has 27 words, and no Also line names sentence length.
  - Marker 2: right: the two ideas are real and the split ends the break.
- 13. Prose standard, section 0, "No repeated construction", 13a, paragraph 42.
  - Marker 1: wrong (4): the passage and the replacement both have 28 words, and the length break is neither ended nor named.
  - Marker 2: wrong (4): the same.
- 14. Tense per section, 14b, paragraph 48.
  - Marker 1: wrong (4): the sentence joins two independent claims, an unnamed Formality break.
  - Marker 2: wrong (2): the sentence states the present state of two fields, the "ongoing state" row, and the replacement treats its two parallel clauses differently.
- 16. Prose standard, section D, paragraphs, 16a, paragraph 8.
  - Marker 1: wrong (4): the text it writes keeps the 32-word sentence on what the project tests.
  - Marker 2: wrong (4): the second sentence it writes is 33 words, left in place.
- 16. Prose standard, section D, paragraphs, 16b, paragraph 11.
  - Marker 1: wrong (4): it keeps "Dit project test of..." at 29 words.
  - Marker 2: wrong (4): the same.
- 16. Prose standard, section D, paragraphs, 16h, paragraph 34.
  - Marker 1: wrong (4): it carries 2e's "serial MRI studies", the same scope change.
  - Marker 2: wrong (4): the same, marked together with 2e.
- 16. Prose standard, section D, paragraphs, 16j, paragraph 35.
  - Marker 1: wrong (4): it keeps the 28-word "Success means" sentence, which no finding ends.
  - Marker 2: wrong (4): the same.
- 16. Prose standard, section D, paragraphs, 16n, paragraph 40.
  - Marker 1: wrong (4): it carries the "T1 scans" list of 2f.
  - Marker 2: right: the text matches 7e and 2f.
- 16. Prose standard, section D, paragraphs, 16o, paragraph 40.
  - Marker 1: wrong (4): it keeps "776 are usable ..., and an organ map ... exists", two independent claims in one sentence.
  - Marker 2: right: the text matches 6a, and the 24-word second sentence is unchanged.
- 16. Prose standard, section D, paragraphs, 16p, paragraph 40.
  - Marker 1: wrong (4): with 4a it leaves a part of four sentences on two ideas.
  - Marker 2: wrong (4): it writes 4a's sentence with "80 percent power" undefined, marked together with 4a.
- 16. Prose standard, section D, paragraphs, 16r, paragraph 41.
  - Marker 1: wrong (4): the part it leaves joins alignment to the reference liver with blinding of the analyst, two ideas.
  - Marker 2: wrong (4): the same.
- 16. Prose standard, section D, paragraphs, 16t, paragraph 41.
  - Marker 1: wrong (4): it keeps "Components are checked..." at 32 words, with "pair of T1 scans" for a sequence.
  - Marker 2: wrong (4): the 32-word sentence and 11e's 28-word first sentence are left in place.
- 16. Prose standard, section D, paragraphs, 16u, paragraph 42.
  - Marker 1: wrong (4): it keeps "The tested study is..." at 28 words.
  - Marker 2: wrong (4): the same.
- 16. Prose standard, section D, paragraphs, 16v, paragraph 42.
  - Marker 1: wrong (4): it keeps the level-2 exclusion and the level-1 sensitivity analysis in one sentence.
  - Marker 2: right: the text matches 2h, and the part holds four sentences on the tested study.
- 16. Prose standard, section D, paragraphs, 16y, paragraph 42.
  - Marker 1 (on its resume): right: the part after the break holds three sentences on what is fixed and reported in advance, and the missing length line belongs to 8g.
  - Marker 2: wrong (4): the part after the break holds the pre-registration, the added guideline sentence and the success criterion, more than one idea, with no further split.
- 16. Prose standard, section D, paragraphs, 16z, paragraph 48.
  - Marker 1: wrong (4): it keeps the two-claim sentence of 14b.
  - Marker 2: wrong (2, 4): it writes 14b's "placed", and the part after the break joins novelty with impact.
- 17. Prose standard, section B, ASCII, 17a, paragraph 64 [word/header1.xml].
  - Marker 1: right: the en dash breaks the ASCII rule, the spaced en dash is the banned construction, and commas end it.
  - Marker 2: wrong (2): the Rule line also names section 0's "en dash as an aside", and these dashes separate parts of a header title, not an aside.

### Group lines either marker names as not meeting "How you group them"

- The manuscript run: marker 1 names group 6 (its CNN example's first-use claim fails, CNN first stands in the title), group 11 (its "softener with no fact" line is contradicted by 11.1, 11.2 and 11.4), group 14 (the line restates the rule and names no cost) and group 9's heading (two section 2 entries under "Methodology"). Marker 2 names none.
- The grant run: marker 1 names groups 1, 3, 5, 9 and 15 (lines that describe the breaks and name no loss, and group 15's cost does not hold in the draft). Marker 2 names groups 5, 9 and 15 (lines that restate the rule or describe the break and name no cost).

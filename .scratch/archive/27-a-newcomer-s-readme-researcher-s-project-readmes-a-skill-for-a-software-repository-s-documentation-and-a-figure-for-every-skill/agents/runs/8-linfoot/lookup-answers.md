# Step 8: the answers to the linfoot run's questions, looked up

Agent a2550cd6357eca88f, claude-opus-5-5.

Lookup report for the questions of /Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/runs/8-linfoot/stop-1-drafts.md (questions 2 to 8). Nothing was changed anywhere. Below, P = /Users/axelfaes/workspace/research-hub/projects/manuscripts/linfoot-estimator, H = /Users/axelfaes/workspace/research-hub, D = the stop-1-drafts.md file above.

## 2. RQ1 to RQ3 and C1 to C4 against the paper

The short answer: the numbers in all four claims match main.tex. There are four mismatches. (a) The section numbers cited are wrong. (b) C2 extends "fresh samples" to the classical panel and MIST, which the fresh test does not cover. (c) Two of the paper's headline results have no claim. (d) The paper's own frame of three difficulties is only partly reflected.

The paper states no research questions as such. Its frame is "Three difficulties" (P/manuscript/main.tex:63) and four contributions (main.tex:71-74). Section numbers come from P/manuscript/main.aux:
- Results is VII (main.aux:151).
- VII-B is held-out families (main.aux:157).
- VII-E is invariance (main.aux:167).
- VII-G is components (main.aux:177).
- VIII is Discussion (main.aux:179).
- VIII-C is Scope (main.aux:185).
- IX is Conclusion (main.aux:187).

RQ1 (D:57), "Can an estimator ... exactly invariant to strictly increasing marginal maps and to the eight symmetries of the square have a lower error than the published heatmap estimator on the 12-family benchmark?"
- Rests on main.tex:48 (abstract), "exactly invariant to strictly increasing transformations of either variable and to the eight symmetries of the unit square ... 0.0544 and 0.0539, against 0.0714 and 0.0708 for the heatmap estimator".
- Faithful.

RQ2 (D:58), "Does the error stay low on copula families removed by name from training, and on training data equal to the published estimator's?"
- Rests on main.tex:304, "retrains $\LG$ with the families of one group removed by name from its training sets", and main.tex:307, "trains the architecture of $\LG$ on $\pi_{\mathrm{GC}}$ alone ... against $\Lret$, the heatmap network retrained on the same training data".
- Faithful. The paper ties this to the first difficulty (main.tex:63: "Section~\ref{sec:res-holdout} reports its error on copula families removed from its training sets, which bears on the first difficulty").

RQ3 (D:59), "Can the positive error of nearest-neighbour and pretrained estimators at exact independence be lowered by exact-independence training examples and a starting value fixed at 0?"
- Rests on main.tex:63: "Nearest-neighbor estimates lie above zero at independence: ... 0.0564 for Kraskov's estimator on the values, 0.1441 on the ranks and 0.0399 for the estimator of this paper".
- Faithful against the paper's own ablations.
- The paper also reports that at independence the estimator is not better than the heatmap estimator: main.tex:299, "On the independent samples of the test set the difference is $+0.0029$ $[+0.0006,+0.0049]$". RQ3 as worded does not mislead, but no RQ or claim records this comparison.

The third difficulty (negative association and reflections) has no RQ of its own. The paper answers it with the reflected and rotated test (main.tex:63: "exactly invariant under the eight symmetries of the unit square, which answers the third difficulty").

C1 (D:61), "exactly invariant ... at most $2.38\times10^{-7}$ (`manuscript/main.tex`, Section VIII)".
- The number is in main.tex:388 (VII-E), "the absolute difference of the two estimates of $\LG$ is $1.55\times10^{-8}$ on average and $2.38\times10^{-7}$ at most ... for $\Lhm$ it is 0.314 on average and 1.00 at most".
- It is also in main.tex:446 (IX, Conclusion).
- Mismatch: "Section VIII" should be VII-E or IX.

C2 (D:62), "lower than that of the published estimator, of seven classical estimators and of padded MIST. Shown by: paired intervals below zero on both benchmark sets and on fresh samples".
- Rests on main.tex:73 (contribution 3), "The paired difference of every other column minus $\LG$, pooled over the 12 families, lies above zero on the test set and the validation set of the benchmark".
- Mismatch: the fresh test covers only the heatmap estimator, not the classical panel or MIST. See main.tex:297, "On the fresh test ... 0.0541 against 0.0699 for $\Lhm$", and P/notes/row22-brief.md:24, "Score ParamPL0z (the three seeds) and `v1` on it".
- The metric wording "two-stage cluster bootstrap" matches main.tex:273: "4000 two-stage resamples, the cells or datasets of the group drawn with replacement and then the samples inside each drawn one".

C3 (D:63), "$-0.0041$ $[-0.0046, -0.0036]$ against the model without them (`manuscript/main.tex`, Section VIII). Baseline: the same model without them (ParamPL)."
- Rests on main.tex:424 (VII-G), "$-0.0041$ $[-0.0046,-0.0036]$ against $\LGz$", and main.tex:446 (IX), "a paired difference for $\LG^{(3)}$ of $-0.0041$".
- LGz is "$\LGzl$ without the starting value fixed at 0" (main.tex:141), which is ParamPL. P/README.md:246 gives "ParamPL0z against ParamPL is -0.0041 [-0.0046, -0.0036]".
- Mismatches: "Section VIII" should be VII-G or IX. The number is for $\LG^{(3)}$, the three-run mean, not the reported network, and the draft does not say so.

C4 (D:64), "$L$ is a functional of the copula, and for an Archimedean copula an integral of its inverse generator, with the closed form for Clayton (contribution 4; supplementary Section S1)".
- Rests on main.tex:74, "Proofs that $L$ is a functional of the copula (Proposition~\ref{prop:copula}) and, for an Archimedean copula, an integral of its inverse generator, with the closed form for the Clayton copula".
- Supplementary S1 is confirmed by P/manuscript/supplementary.aux:5 (`sec:archimedean` = S1).
- Faithful.

Results with no claim:
- The reflected and rotated result, which is in the abstract (main.tex:48) and the conclusion (main.tex:446): "0.0250 against 0.4487 for the heatmap estimator ... $-0.4237$ $[-0.4549,-0.3919]$".
- Contribution 2, the training prior (main.tex:72).
- "lower error than the heatmap estimator on seven of the 12 families" (main.tex:73).

The same section-number error appears elsewhere in the draft. D:108 says "Section VII-C (Scope)", but Scope is VIII-C (main.aux:185; VII-C is the classical-panel results, main.tex:309). D:425 lists the sources as "Sections I-B, I-C, VII-C, VIII", and should read I-B, I-C, VIII-C, IX.

## 3. What counts as good enough, and the setting (manual or automatic, with its count of methods)

No file holds either in this form. Files searched: P/README.md, P/plan.md, P/project.yml, P/notes/*.md, P/code/README.md, and the researcher skill text (/Users/axelfaes/workspace/ordo/skills/academic/researcher/SKILL.md:284-285). A grep for "good enough|manual|automatic|count of methods" found none in the project.

What the files show about good enough:
- P/README.md:234: "no superiority claim over `v1` on the four families where it is lower, and step 6 aims at a prior whose estimator is lowest on all 12."
- P/README.md:225 (paper design D14): "every table printed as it is, with no superiority claim on a row where another estimator is lower."
- P/plan.md:25 (D41): "its results against the published estimator and the classical estimators, with honest intervals on every claim."
- P/plan.md:51 (D27), the criterion by which the presented estimator was chosen: "ParamPL0z ... the only one of the 16 models of batch 1 that the published model beats on no group."
- The step 6 aim of "lowest on all 12" was not reached in the paper: "lower error than the heatmap estimator on seven of the 12 families" (main.tex:73), and "On the five remaining families ... the interval holds zero" (main.tex:299).

What the files show about the setting:
- Every method (arm) up to 2026-11-06 was ruled by Axel one result at a time, which is the manual setting in practice. Examples: P/plan.md:58 (D20, Axel), P/plan.md:57 (D21, "Open item D, Axel") and P/plan.md:52 (D26, "Open item G, option 2, Axel").
- From 2026-11-06 onward, P/plan.md:45 (D33, Axel) applies: "Axel answers no open items. From now on in this plan the session rules every decision itself on its recommendation."
- No count of methods is set anywhere. Batch 1 holds 16 models (P/plan.md:51).

Proposal: good enough = the presented estimator has a lower pooled RMSE than the heatmap estimator on both benchmark sets, with a paired interval below zero, and an honest interval on every claim (D41), with no superiority claim on a row where another estimator is lower (D14 of the paper design, README.md:225). The setting is manual, with no count; under D33 the session rules on Axel's behalf. This rests on the rulings quoted above. The "lowest on all 12" aim of README.md:234 should not become the good-enough line: it is an aim of step 6 marked "private guidance", and the paper reaches 7 of 12. Recording it as good enough would mark the main result "below what was set". Axel has to decide this.

## 4. The August manuscript: 33 or 32 pages

It is 33 pages.
- P/manuscript/archive/2026-08/main.log:545: "Output written on main.pdf (33 pages, 2677930 bytes)." The log header is dated "25 AUG 2026 21:07".
- `pdfinfo P/manuscript/archive/2026-08/main.pdf` prints "Pages: 33".

Git history of the page counts, from `git log --all -- .../manuscript/main.pdf` with `pdfinfo` on each committed PDF:

| Commit | Date | Pages |
|---|---|---|
| 4d65e91e4 | 2026-08-22 | 26 |
| 9b8b55e28 | 2026-08-23 | 31 |
| df3041c76 | 2026-08-23 | 32 |
| 7609bbfae | 2026-08-24 | 34 |
| 826434964 | 2026-08-24 | 33 |
| 64842ad6e | 2026-08-26 | 33 |
| 1225d909c | 2026-09-09 | 33 |

`cmp` shows the archived PDF is byte-identical to the one in 1225d909c.

How the two statements arose:
- "32 pp" was added in df3041c76 (2026-08-23) as the Deliverables row "methods document | `manuscript/main.pdf`, 32 pp" and in the record line of 2026-08-23. It was true of that day's build.
- The archive commit 01c08a237 (2026-10-19) changed the Deliverables row to "`manuscript/archive/2026-08/main.pdf`, 33 pp" and added P/README.md:232 ("33 pages"). It left the dated record at P/README.md:313 ("The August manuscript is 32 pp") unchanged.

So "32 pp" describes the 2026-08-23 build, and the frozen manuscript is 33 pages.

## 5. Where the output and error files of the cluster jobs stand

On the cluster, in `~/projects/linfoot-estimator/logs/`. There is no local `logs/` (`ls P` shows none).
- All 69 job files (P/code/hpc/*.slurm and P/code/attic/mist/*.slurm) carry an `#SBATCH --output` line (`grep -L` found none without one). Examples:
  - P/code/hpc/linfoot_train_groups.slurm:9: `#SBATCH --output=/home/faesayl/projects/linfoot-estimator/logs/%x_%A_%a.out`.
  - 67 files use that absolute folder (`%x_%j.out` or `%x_%A_%a.out`).
  - P/code/hpc/linfoot_twin_application.slurm:7 and linfoot_twin_mist.slurm:7 use `#SBATCH --output=logs/%x_%j.out`, submitted from the project folder (linfoot_twin_application.slurm:12: `cd ~/projects/linfoot-estimator && sbatch code/hpc/linfoot_twin_application.slurm`).
- Batch 1 jobs override this at submission:
  - P/code/hpc/batch_lib.sh:248: `LOGS="$HOME/projects/linfoot-estimator/logs"`.
  - batch_lib.sh:455: `--output="$LOGS/b1-${step}_%A_%a.out"`.
  - P/code/hpc/run_all.sh:241 does the same for its helper job (`b1-wave2-helper_%j.out`).
- No file has an `#SBATCH --error` line (grep found none). Under SLURM's default behaviour, which is not stated in any project file, stderr then goes into the same .out file.
- Hub convention, H/docs/HPC-UTwente-howto.md:179: "Job `.out/.err` and job-id notes live **inside** the project (`~/projects/<proj>/logs/`), never at `~`."
- The 67 absolute `/home/<user>/` paths conflict with H/CLAUDE.md:83: "No hardcoded user/machine paths."

## 6. Account, modules and partition time limits

Account: no file holds it. No job file has `--account` or `-A` (grep over P/code/hpc and P/code/attic). H/docs/HPC-UTwente-howto.md, H/CLAUDE.md, H/README.md and H/CONTEXT.md name none either. Proposal: "none set; jobs run under the user's default account". This rests on batch 1 having been submitted and run with no account line (P/plan.md:22, D16: "jobs 663578 to 663596").

Modules: none are loaded. No `module load` appears in any job or submit script (grep over P/code/hpc and P/code/attic). The environment is a packed tarball run with the system python:
- P/code/hpc/batch_env.sh:25-26: `SITE=$(ls -d "$STAGE"/$ENV_NAME/lib/python*/site-packages)` and `export PYTHONPATH="$SITE"`.
- H/docs/HPC-UTwente-howto.md:218: "pip's torch wheel bundles its own CUDA runtime, so it runs on GPU nodes **without** a `cuda` module."

Partitions and their time limits:
- Partitions used: main-cpu (26 files) and main-gpu (43 files), from `grep '#SBATCH --partition'`.
- Requested times: main-cpu 00:30 to 07:00:00; main-gpu 00:30 to 48:00:00. The 48 h requests are P/code/hpc/linfoot_train_arm7a.slurm:7 and linfoot_train_arm7b.slurm:7.
- No file holds the maximum walltime of either partition. H/docs/HPC-UTwente-howto.md:223 gives only the default: "**Partitions open to everyone:** `main-cpu`, `main-gpu`, `main` (mixed), with a 24 h default walltime."
- The scripts read the limit at submission: P/code/hpc/run_all.sh:136, `max=$(sinfo -h -p main-gpu -o %l | head -1)`. run_all.sh:139 stops if it is below `LONGEST=2880` minutes (run_all.sh:78).

Proposal: main-gpu allows at least 48 h. This is an inference from batch 1 being submitted past that check (D16, plan.md:22). The main-cpu maximum is not recorded; `sinfo -p main-cpu -o %l` on the login node would settle it.

QOS limits: P/code/hpc/batch_lib.sh:5: "The QOS accepts at most 100 submitted tasks, array tasks included, and runs at most 8."

## 7. Licence of the deposit, and how the code is cited

The deposit `code/` carries no LICENSE. `find P -maxdepth 3 -iname "LICENSE*"` found none, and P/plan.md:16 (item 14 rulings) says "`requirements.txt` and `.depositignore` are added and `LICENSE` is not".

The hub convention says otherwise: H/README.md:100, "LICENSE            MIT unless the coauthors agree otherwise". This conflicts with plan.md:16, and the conflict is Axel's to settle.

The released package is MIT. /Users/axelfaes/workspace/linfoot/LICENSE:1-3: "MIT License / Copyright (c) 2026 Axel Faes, Stephanie M. van den Berg, Ulrich Halekoh, Soren Moller, Andreas Kryger Jensen and Jacob von Bornemann Hjelmborg". Its remote is https://github.com/TheAxeC/linfoot.git (`git remote -v`). Its README.md:3 names the paper, but it has no citation section.

The third-party model is excluded from the deposit. P/code/vendor/README.md:3: "it is not ours to redistribute, so the deposit leaves it out (`vendor/*.keras` in `code/.depositignore`)". Its licence is not recorded locally.

What a citation would use:
- Paper title, P/manuscript/main.tex:32 and P/project.yml:10: "A Pretrained Rank-Based Estimator of the Linfoot Informational Correlation". No DOI yet (project.yml:32: `doi:` is empty). The venue is TNNLS (project.yml:24: `venue: tnnls`).
- Preprint, P/manuscript/cover-letter.tex:22: "the preprint arXiv:2512.12358, ``Towards a pretrained deep learning estimator of the Linfoot informational correlation'', by S.~M. van den Berg, U.~Halekoh, S.~M\"oller, A.~Kryger Jensen and J.~von Bornemann Hjelmborg ... The authors will replace the arXiv version with the published manuscript."
- main.tex and main.bib do not cite the preprint (grep for "vandenberg|Towards a pretrained" found no entry). This fits the double-anonymous review, D49 (P/plan.md:32).
- P/manuscript/main.tex Data Availability: "the code, the trained weights of $\LG$ ... are released in a public repository on acceptance".

Proposal: the deposit carries MIT with the same six-author copyright line as the released package. That would match H/README.md:100 and the package, but it requires Axel to overturn plan.md:16. The code is cited as the paper by its title (DOI to be added on acceptance) and, until the preprint is replaced, the preprint arXiv:2512.12358 by its title from cover-letter.tex:22.

## 8. Is `code/` the code folder

Yes.
- `find P/code -maxdepth 1` lists `.depositignore`, `README.md`, `requirements.txt`, `paper.py`, `core`, `experiments`, `hpc`, `results`, `figures`, `attic`, `vendor` (plus `__pycache__` and `.DS_Store`).
- `find P \( -name "*.py" -o -name "*.slurm" -o -name "*.sh" -o -name "*.R" \) -not -path "./code/*"` found no code outside `code/`. There are 99 .py files under `code/`, excluding venv and caches.
- The manuscript reaches the results through links into it: `manuscript/results -> ../code/results` and `manuscript/archive/results -> ../../code/results` (`ls -la`).
- Rulings: P/plan.md:27 (D42), "The folder `code/` is deposited as the public repository and is its whole content". Hub convention: H/README.md:96, "`code/` serves two readers: the public deposit, which is `code/` minus what `code/.depositignore` excludes".

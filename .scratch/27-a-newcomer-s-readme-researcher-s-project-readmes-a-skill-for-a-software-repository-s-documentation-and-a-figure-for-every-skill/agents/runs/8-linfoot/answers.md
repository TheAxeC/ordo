# Step 8: the orchestrator's answers to the linfoot run's questions

From `lookup-answers.md` (agent a2550cd6357eca88f), and read-only commands on the cluster run on 2026-11-26 (`ssh utwente` with `ls`, `du`, `sacctmgr`, `sinfo`). P is the project folder.

1. `.depositignore`: settled by the rule of v11.2.1: `attic/` and `results/*` already have their folders, no results line is added, and the added lines stand above `!results/phase2_scaled.pt`, so the shipped weights stay in the deposit (D42).
2. Research questions and claims, corrected against `manuscript/main.tex` and `main.aux`:
   - RQ1 to RQ3 stand as drafted. RQ4 is added for the paper's third difficulty (main.tex:63): does the estimator keep its error under the reflections and rotations of the unit square, where the heatmap estimator does not?
   - C1: "Section VIII" becomes Section VII-E (main.tex:388) and the Conclusion, IX (main.tex:446).
   - C2: "fresh samples" is said of the heatmap estimator only (main.tex:297); against the seven classical estimators and padded MIST, the paired intervals are on the test set and the validation set of the benchmark (main.tex:73).
   - C3: "Section VIII" becomes Section VII-G (main.tex:424) and IX; the difference is that of $\LG^{(3)}$, the mean of three runs, against ParamPL.
   - C4 stands.
   - C5 is added: on the reflected and rotated test, 0.0250 against 0.4487 for the heatmap estimator, a paired difference of $-0.4237$ $[-0.4549,-0.3919]$ (main.tex:48 and 446).
   - Elsewhere in the drafts, Scope is Section VIII-C (main.aux:185), and the sources line reads Sections I-B, I-C, VIII-C and IX.
3. Constraints and limits: good enough is a lower pooled error than the heatmap estimator on both benchmark sets with a paired interval below zero, an honest interval on every claim (P/plan.md:25, D41) and no superiority claim on a row where another estimator is lower (P/README.md:225). The setting is manual, with no count of methods, the session ruling on the user's behalf under D33 (P/plan.md:45).
4. Papers: the August manuscript is 33 pages (`manuscript/archive/2026-08/main.log:545`, "Output written on main.pdf (33 pages, ...)"; `pdfinfo` prints "Pages: 33"). The 32 pages were the build of 2026-08-23.
5. Where things live: the output files of the cluster jobs stand on the cluster in `~/projects/linfoot-estimator/logs/` (617 files, 5.7M by `ls | wc -l` and `du -sh`), as each job's `#SBATCH --output` line names them; no job sets `--error`, so its errors go into the same file.
6. Cluster facts: the account is `bms-code` (`sacctmgr` printed `bms-code|`), set by no job file; no module is loaded, the jobs run the packed environment of `code/hpc/batch_env.sh`; the jobs use `main-cpu` and `main-gpu`, whose time limit `sinfo -h -o "%P %l"` prints as `infinite`, with a 24 h default walltime (hub guide, `docs/HPC-UTwente-howto.md:223`); the QOS accepts at most 100 submitted tasks and runs at most 8 (`code/hpc/batch_lib.sh:5`).
7. Licence and citation: the deposit adds no `LICENSE`, as the project's ruling of item 14 says (P/plan.md:16); the released package is MIT (its `LICENSE`). Cite the paper "A Pretrained Rank-Based Estimator of the Linfoot Informational Correlation" (DOI on acceptance) and the preprint of van den Berg et al., arXiv:2512.12358, "Towards a pretrained deep learning estimator of the Linfoot informational correlation".
8. The code folder: `code/`, confirmed (no code stands outside it; D42, P/plan.md:27).

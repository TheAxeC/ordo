# Step 8: the orchestrator's answers to the engram run's questions

From `lookup-answers.md` (agent ad3cfbb8d27ee411e) and read-only commands on the cluster run on 2026-11-26 (`ssh utwente` with `ls`, `grep`, `sacctmgr`, `sinfo`).

- Q1 venue: ICLR, `project.yml:15` (`venue: iclr`). The registry's ICLR 2027 deadline (2026-09-18) has passed, so the README names ICLR with the cycle not set.
- Q2 research questions and claims: RQ1, RQ2, C1 and C2 stand as drafted (README.md lines 11, 19, 92, 182, 189). C2's baseline: the unlearning methods AMNESIA evaluates, RMU, GradDiff, KL-Min and SimNPO (README.md:92), and the curvature line's localisation plus removal (Merullo et al. 2025).
- Q3 the gate's fallback: removed from the README and from `notes/next.md`; a decomposition that only ties the SVD leads to the next method under the automatic setting (Q7). `present/main.md:21` is outside the readme mode and is left as it is.
- Q4 MIMIC-IV-Note: on the cluster at `~/data/mimic-iv-note/note/` (`ls` there lists `discharge.csv.gz`, `discharge_detail.csv.gz`, `radiology.csv.gz`, `radiology_detail.csv.gz`, `index.html`), the registry path `~/data/mimic-iv-note` (`.oculus/data/research/data.yml:120`), access credentialed through PhysioNet.
- Q5 PMC-Patients: not fetched on either machine (`ls ~/data/pmc-patients` on the cluster: No such file or directory; no folder on the Mac). The README says the loader reads `~/data/pmc-patients/PMC-Patients-V2.json` (data.yml:99-103) and that it is not fetched yet.
- Q6 deadline: none set; the gate is sized at weeks (README.md:180).
- Q7 setting: automatic, with a count of 5 methods; the user can change it in words.
- Q8 the curvature line: Merullo et al. (2025), "From Memorization to Reasoning in the Spectrum of Loss Curvature", arXiv:2510.24256, `code/references.bib:86-92`.
- Q9 result files: on the cluster under `~/projects/engram/results/<jobid>/` (576K) with logs under `~/projects/engram/logs/` (118K). The jobs: 579290 (12M at the 32k vocabulary, L40S, 274,300 tok/s) and 579291 (72M at the 32k vocabulary, L40S, 73,851 tok/s) by `grep` of the logs; 579312 (end-to-end at 8192 references, A40, 13 min, `project.yml:17`) and 579326 (re-scoring at 8192 references); also 579242, 579250, 579263, 579287 and 579288. The README names each number with its job id and where the files stand; copying them into the project is not part of the readme mode.
- Q10 account: `bms-code` (`sacctmgr -n -P show assoc user=$USER format=account,partition` printed `bms-code|`); the job scripts set no `--account`.
- Q11 time limits: `sinfo -h -o "%P %l"` prints `infinite` for every partition, `main-cpu`, `main-gpu` and `main` among them; the hub guide gives a 24 h default walltime (`docs/HPC-UTwente-howto.md:223`).
- Q12 the localiser: in this project, outside `code/` (README.md:168, CLAUDE.md:9). `code/README.md:167` predates the fold into the hub (commit de3c2e18a). For the deposit reader: "engram is the engine. The localiser, the ablation study and the per-record erasure method are not part of this package." The pointer "See `CLAUDE.md`." is dropped.
- Q13 run time: measured only on the synthetic corpus, about 13 minutes (job 579312, A40). A run on real data is not measured yet, and `## Run` says so.
- Q14 licence and citation: MIT (`code/pyproject.toml:15`, and the hub's rule "MIT unless the coauthors agree otherwise"); the draft adds `code/LICENSE` with the MIT text and "Copyright (c) 2026 Axel Faes", as the sibling projects' `code/LICENSE` has it. Citation, until a paper exists: Axel Faes, engram, version 0.1.0 (`code/pyproject.toml:7`), with the Zenodo DOI once the code is deposited.
- Q15 `.depositignore`: settled by the rule of v11.2.1: `/data/` already has the folder, so no data line is added.
